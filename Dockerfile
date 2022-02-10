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

# Init repository
#RUN mkdir -p /nds_aaos && cd /nds_aaos && \
#    git config --global user.name "Klebert Engineering Team" && \
#    git config --global user.email "team@klebert-engineering.de" && \
#    DEBIAN_FRONTEND="noninteractive" repo init -u https://android.googlesource.com/platform/manifest -b android11-qpr3-release && \
#    git clone https://github.com/klebert-engineering/ndslive_aaos_rpi-local_manifests .repo/local_manifests -b ke-main && \
#    repo sync -c --no-tags --no-clone-bundle -j4

