FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y mesa-utils

ENV LD_LIBRARY_PATH=/usr/lib/wsl/lib
CMD /usr/bin/glxinfo -B

RUN apt-get update && apt install -y --no-install-recommends \
    build-essential cmake ninja-build \
    sudo git ca-certificates wget unzip

RUN apt-get update && apt install -y --no-install-recommends \
    libeigen3-dev libatlas-base-dev libsuitesparse-dev \
    libglew-dev libgl1-mesa-dev xorg-dev libepoxy-dev \
    libgtk2.0-dev libgtk-3-dev libjpeg-dev libpng-dev libtiff-dev \
    python3-dev python3-pip

ARG USER=dev
ARG UID=1000
RUN useradd -m -u ${UID} -s /bin/bash ${USER}
RUN echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ${USER}
WORKDIR /home/${USER}/ws

# Install Pangolin
RUN git clone --depth 1 --recurse-submodules --shallow-submodules https://github.com/stevenlovegrove/Pangolin.git && \
    cd Pangolin && \
    printf 'y\n' | ./scripts/install_prerequisites.sh required && \
    cmake -G Ninja -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_PANGOLIN_FFMPEG=OFF \
        -DBUILD_PANGOLIN_PYTHON=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTS=OFF && \
    cmake --build build -j 4 && \
    sudo cmake --install build

RUN sudo apt-get update && sudo apt install -y --no-install-recommends \
    mesa-common-dev freeglut3-dev libsuitesparse-dev libeigen3-dev xorg-dev libgtk2.0-dev \
    python3-dev python3-pip

# Install OpenCV
RUN mkdir -p OpenCV && cd OpenCV && \
    wget -O opencv.zip https://github.com/opencv/opencv/archive/4.9.0.zip && \
    wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.9.0.zip && \
    unzip opencv.zip && rm opencv.zip && \
    unzip opencv_contrib.zip && rm opencv_contrib.zip && \
    cmake -G Ninja \
          -B build \
          -D CMAKE_BUILD_TYPE=RELEASE \
          -D OPENCV_EXTRA_MODULES_PATH=opencv_contrib-4.9.0/modules \
          -D BUILD_EXAMPLES=OFF \
          -S opencv-4.9.0 && \
    cmake --build build -j 4 && \
    sudo cmake --install build

RUN sudo apt-get update && sudo apt install -y --no-install-recommends \
    gdb