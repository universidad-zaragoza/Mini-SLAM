/**
* This file is part of Mini-SLAM
*
* Copyright (C) 2021 Juan J. Gómez Rodríguez and Juan D. Tardós, University of Zaragoza.
*
* Mini-SLAM is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Mini-SLAM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
* the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License along with Mini-SLAM.
* If not, see <http://www.gnu.org/licenses/>.
*/

#include "KannalaBrandt8.h"

#define fx vParameters_[0]
#define fy vParameters_[1]
#define cx vParameters_[2]
#define cy vParameters_[3]
#define k0 vParameters_[4]
#define k1 vParameters_[5]
#define k2 vParameters_[6]
#define k3 vParameters_[7]

void KannalaBrandt8::project(const Eigen::Vector3f& p3D, Eigen::Vector2f& p2D){
    /*
     * Your code for Lab 3 - Task 5 here!
     */
}

void KannalaBrandt8::unproject(const Eigen::Vector2f& p2D, Eigen::Vector3f& p3D) {
    /*
     * Your code for Lab 3 - Task 5 here!
     */
}

void KannalaBrandt8::projectJac(const Eigen::Vector3f& p3D, Eigen::Matrix<float,2,3>& Jac) {
    /*
     * Your code for Lab 3 - Task 5 here!
     */
}

void KannalaBrandt8::unprojectJac(const Eigen::Vector2f& p2D, Eigen::Matrix<float,3,2>& Jac) {
    throw std::runtime_error("KannalaBrandt8::unprojectJac not implemented yet");
}