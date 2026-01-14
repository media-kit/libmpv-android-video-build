#!/bin/bash -e

. ../../include/depinfo.sh
. ../../include/path.sh

build=_build$ndk_suffix

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	rm -rf $build
	exit 0
else
	exit 255
fi

cp ../../scripts/libx264.build meson.build

unset CC CXX # meson wants these unset

mkdir $build

# Stripping breaks the asm ELF metadata within libx264.a
# We strip at the end anyway
STRIP="" meson setup $build --cross-file "$prefix_dir"/crossfile.txt --prefix="$prefix_dir"

meson compile -C $build libx264
meson install -C $build
