#Miinimum CMAKE version required
cmake_minimum_required(VERSION 3.5)
project(Mini-SLAM)

#We require the C++14 standard
set(CMAKE_CXX_STANDARD 14)

#Compilation flags:
#   -Flag for code optimizations: -O3
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/Thirdparty/OpenCV/build")
  set(OpenCV_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Thirdparty/OpenCV/build")
endif()

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/Thirdparty/Pangolin/build")
  set(Pangolin_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Thirdparty/Pangolin/build")
endif()

add_subdirectory(Modules)
add_subdirectory(Apps)
