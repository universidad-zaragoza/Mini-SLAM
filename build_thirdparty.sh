#!/bin/bash

echo "Configuring and building Thirdparty/g2o ..."

cd Thirdparty/g2o
cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j 4

cd ../Sophus

echo "Configuring and building Thirdparty/Sophus ..."

cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j 4

cd ../../
