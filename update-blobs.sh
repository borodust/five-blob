#!/usr/bin/env bash

name=five
repository_url=https://github.com/borodust/bodge-five


if [[ -z  $1 ]] ; then
   echo "Version is not provided!"
   exit 1;
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -A platforms
platforms=(["linux"]="so" ["osx"]="dylib" ["windows"]="dll")

declare -A archs
archs=(["x86_64"]="x86_64")

for arch in "${!archs[@]}" ; do
    for platform in "${!platforms[@]}" ; do
        target_dir="$script_dir/${archs[$arch]}/"
        mkdir -p "$target_dir"

        lib="lib$name.${platforms[$platform]}"
        url="$repository_url/releases/download/$1/$lib-$arch-$platform-$1"
        echo "Downloading $lib from $url to $target_dir/$lib"
        if ! wget -O "$target_dir/$lib" -q "$url" ; then
            echo "$lib download failed"
            exit 1;
        fi
        wrapper="lib$name.wrapper.${platforms[$platform]}"
        wrapper_url="$repository_url/releases/download/$1/$wrapper-$arch-$platform-$1"
        echo "Downloading $wrapper from $url to $target_dir/$wrapper"
        if ! wget -O "$target_dir/$wrapper" -q "$wrapper_url" ; then
            echo "$wrapper download failed"
            exit 1;
        fi
    done
done
