#!/bin/bash -e

. ./include/depinfo.sh

[ -z "$WGET" ] && WGET=wget

mkdir -p deps && cd deps

# mbedtls
[ ! -d mbedtls ] && git clone --depth 1 --branch v$v_mbedtls https://github.com/Mbed-TLS/mbedtls.git mbedtls

# dav1d
[ ! -d dav1d ] && git clone --depth 1 --branch $v_dav1d https://code.videolan.org/videolan/dav1d.git dav1d

# libxml2
[ ! -d libxml2 ] && git clone --depth 1 --branch v$v_libxml2 --recursive https://gitlab.gnome.org/GNOME/libxml2.git libxml2

# libogg
[ ! -d libogg ] && $WGET https://github.com/xiph/ogg/releases/download/v${v_libogg}/libogg-${v_libogg}.tar.gz && tar -xf libogg-${v_libogg}.tar.gz && mv libogg-${v_libogg} libogg && rm libogg-${v_libogg}.tar.gz

# libvorbis
[ ! -d libvorbis ] && $WGET https://github.com/xiph/vorbis/releases/download/v${v_libvorbis}/libvorbis-${v_libvorbis}.tar.gz && tar -xf libvorbis-${v_libvorbis}.tar.gz && mv libvorbis-${v_libvorbis} libvorbis && rm libvorbis-${v_libvorbis}.tar.gz

# libvpx
[ ! -d libvpx ] && git clone --depth 1 --branch meson-$v_libvpx https://gitlab.freedesktop.org/gstreamer/meson-ports/libvpx.git

# libx264
[ ! -d libx264 ] && git clone --depth 1 https://code.videolan.org/videolan/x264.git --branch master libx264

# ffmpeg
[ ! -d ffmpeg ] && git clone --depth 1 --branch n$v_ffmpeg https://github.com/FFmpeg/FFmpeg.git ffmpeg

# freetype2
[ ! -d freetype ] && git clone --depth 1 --branch VER-$v_freetype https://gitlab.freedesktop.org/freetype/freetype.git freetype

# fribidi
[ ! -d fribidi ] && git clone --depth 1 --branch v$v_fribidi https://github.com/fribidi/fribidi.git fribidi

# harfbuzz
[ ! -d harfbuzz ] && git clone --depth 1 --branch $v_harfbuzz https://github.com/harfbuzz/harfbuzz.git harfbuzz

# libass
[ ! -d libass ] && git clone --depth 1 --branch $v_libass https://github.com/libass/libass.git libass

# shaderc
mkdir -p shaderc
cat >shaderc/README <<'HEREDOC'
Shaderc sources are provided by the NDK.
see <ndk>/sources/third_party/shaderc
HEREDOC

# mpv
[ ! -d mpv ] && git clone https://github.com/mpv-player/mpv.git mpv && cd mpv && git reset --hard 78d43740f52db817d98bcf24fb30a76ab6fa13ff && cd ..

# fftools_ffi
[ ! -d fftools_ffi ] && git clone --depth 1 --branch main https://github.com/moffatman/fftools-ffi.git fftools_ffi

# media-kit-android-helper
[ ! -d media-kit-android-helper ] && git clone --depth 1 --branch fix/no-dup-fd https://github.com/media-kit/media-kit-android-helper.git

# media_kit
[ ! -d media_kit ] && git clone --depth 1 --single-branch --branch main https://github.com/alexmercerind/media_kit.git

cd ..
