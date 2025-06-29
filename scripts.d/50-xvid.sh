#!/bin/bash

SCRIPT_REPO="https://github.com/delthas/xvid.git"
SCRIPT_COMMIT="master"

ffbuild_enabled() {
    [[ $VARIANT == lgpl* ]] && return -1
    return 0
}

ffbuild_dockerdl() {
    echo "retry-tool sh -c \"rm -rf xvid && git clone '${SCRIPT_REPO}' xvid\" && cd xvid && git checkout '${SCRIPT_COMMIT}'"
}

ffbuild_dockerbuild() {
    cd xvidcore/build/generic

    # The original code fails on a two-digit major...
    sed -i\
        -e 's/GCC_MAJOR=.*/GCC_MAJOR=10/' \
        -e 's/GCC_MINOR=.*/GCC_MINOR=0/' \
        configure.in

    ./bootstrap.sh

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
    )

    if [[ $TARGET == win* || $TARGET == linux* ]]; then
        myconf+=(
            --host="$FFBUILD_TOOLCHAIN"
        )
    else
        echo "Unknown target"
        return -1
    fi

    export CFLAGS="$CFLAGS -std=gnu99"

    ./configure "${myconf[@]}"
    make -j$(nproc)
    make install

    if [[ $TARGET == win* ]]; then
        rm "$FFBUILD_PREFIX"/{bin/libxvidcore.dll,lib/libxvidcore.dll.a}
    elif [[ $TARGET == linux* ]]; then
        rm "$FFBUILD_PREFIX"/lib/libxvidcore.so*
    fi
}

ffbuild_configure() {
    echo --enable-libxvid
}

ffbuild_unconfigure() {
    echo --disable-libxvid
}
