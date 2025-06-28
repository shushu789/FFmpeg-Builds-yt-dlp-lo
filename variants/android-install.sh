#!/bin/bash

package_variant() {
    IN="$1"
    OUT="$2"

    # Create Android-specific directory structure
    mkdir -p "$OUT"/lib/${ANDROID_ABI}
    mkdir -p "$OUT"/include
    mkdir -p "$OUT"/bin

    # Copy libraries (for shared builds)
    if [[ -d "$IN"/lib ]]; then
        cp -r "$IN"/lib/* "$OUT"/lib/${ANDROID_ABI}/
    fi

    # Copy headers
    if [[ -d "$IN"/include ]]; then
        cp -r "$IN"/include/* "$OUT"/include/
    fi

    # Copy binaries if they exist
    if [[ -d "$IN"/bin ]]; then
        cp "$IN"/bin/* "$OUT"/bin/ 2>/dev/null || true
    fi

    # Copy pkg-config files
    if [[ -d "$IN"/lib/pkgconfig ]]; then
        mkdir -p "$OUT"/lib/pkgconfig
        cp -r "$IN"/lib/pkgconfig/* "$OUT"/lib/pkgconfig/
    fi
}