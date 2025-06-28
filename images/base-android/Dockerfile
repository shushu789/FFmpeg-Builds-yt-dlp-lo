ARG GH_REPO=ghcr.io/yt-dlp/ffmpeg-builds
FROM $GH_REPO/base:latest

# Install Android NDK
ENV ANDROID_NDK_VERSION=r25c
ENV ANDROID_API_LEVEL=21
ENV ANDROID_NDK_ROOT=/opt/android-ndk

RUN \
    cd /tmp && \
    wget -nv https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux.zip && \
    unzip -q android-ndk-${ANDROID_NDK_VERSION}-linux.zip && \
    mv android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_ROOT} && \
    rm android-ndk-${ANDROID_NDK_VERSION}-linux.zip && \
    chmod -R 755 ${ANDROID_NDK_ROOT}

# Setup toolchain for different Android architectures
ENV ANDROID_TOOLCHAIN_ROOT=${ANDROID_NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64
ENV ANDROID_SYSROOT=${ANDROID_TOOLCHAIN_ROOT}/sysroot

# Add NDK to PATH
ENV PATH="${ANDROID_TOOLCHAIN_ROOT}/bin:${PATH}"

# Set up cross-compilation environment
ENV ANDROID_HOME=/opt/android-sdk
ENV CC_arm64_v8a=${ANDROID_TOOLCHAIN_ROOT}/bin/aarch64-linux-android${ANDROID_API_LEVEL}-clang
ENV CC_armeabi_v7a=${ANDROID_TOOLCHAIN_ROOT}/bin/armv7a-linux-androideabi${ANDROID_API_LEVEL}-clang
ENV CC_x86_64=${ANDROID_TOOLCHAIN_ROOT}/bin/x86_64-linux-android${ANDROID_API_LEVEL}-clang
ENV CC_x86=${ANDROID_TOOLCHAIN_ROOT}/bin/i686-linux-android${ANDROID_API_LEVEL}-clang

# Configure pkg-config for Android
ENV PKG_CONFIG_LIBDIR=${ANDROID_SYSROOT}/usr/lib/pkgconfig