FROM ubuntu:21.04
# Set up dev environment
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    git-core \
    gnupg \
    flex \
    bison \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z1-dev \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    fontconfig \
    libncurses5 \
    procps \
    libssl-dev \
    bc \
    fdisk \
    eject

RUN apt-get install -y gcc-aarch64-linux-gnu

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y repo

# Init repositories
RUN mkdir -p /nds_aaos && cd /nds_aaos && \
    git config --global user.name "Klebert Engineering Team" && \
    git config --global user.email "team@klebert-engineering.de" && \
    DEBIAN_FRONTEND="noninteractive" repo init -u https://android.googlesource.com/platform/manifest -b android11-qpr3-release && \
    git clone https://github.com/klebert-engineering/ndslive_aaos_rpi-local_manifests .repo/local_manifests -b ke-main && \
    repo sync

# Manual patching as done in https://github.com/android-rpi/device_arpi_rpi4/wiki/arpi-11-:-framework-patch


# Next step: RUN
# cd kernel/arpi
# ARCH=arm64 scripts/kconfig/merge_config.sh arch/arm64/configs/bcm2711_defconfig kernel/configs/android-base.config kernel/configs/android-recommended.config
# ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make Image.gz
# ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- DTC_FLAGS="-@" make broadcom/bcm2711-rpi-4-b.dtb
# ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- DTC_FLAGS="-@" make overlays/vc4-kms-v3d-pi4.dtbo
# cd ../..


## Build Android Kernel: RUN

# source build/envsetup.sh
# lunch ndslive_car_rpi4-userdebug
# make -j18 ramdisk systemimage vendorimage

