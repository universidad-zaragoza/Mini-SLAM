# Mini-SLAM

**Authors:** Juan J. Gómez Rodríguez, Víctor M. Batlle

Minimal implementation of a SLAM system for the practical assignment of the SLAM course.

## Installation

### 1. Install Docker

Install Docker using your preferred method. If you are not sure where to start, below are some recommended options depending on your host operating system:

* **Windows or macOS:** [Docker Desktop](https://www.docker.com/products/docker-desktop)
* **Linux:** [Docker CE/EE](https://docs.docker.com/install/#supported-platforms) and [Docker Compose](https://docs.docker.com/compose/install)

### 2. Install VS Code

Install [Visual Studio Code](https://code.visualstudio.com/) on your host machine.

### 3. Install an X server (Windows/macOS only)

<details>

<summary>Windows</summary>

The recommended solution for X11 forwarding on Windows 10 or newer is to use WSL2 (Windows Subsystem for Linux version 2):

1. Open PowerShell as administrator (search for "PowerShell", right-click, and select **Run as administrator**).
2. Run `wsl --install`.
3. In Docker Desktop, go to `Settings` > `Resources` > `WSL Integration` and enable it.

</details>

<details>

<summary>macOS</summary>

On macOS, we will use XQuartz:

1. Open a Terminal on your macOS host.
2. Run `brew install --cask xquartz` (if you do not have Homebrew installed, see instructions [here](https://brew.sh/)).
3. Run `open -a XQuartz`.
4. Go to `XQuartz` > `Settings...` > `Security` and ensure **Allow connections from network clients** is enabled.
5. Reboot your computer.

</details>

### 4. Open folder in VS Code

Launch VS Code and go to `File` > `Open Folder...`, then select your Mini-SLAM folder.

Click on **Yes, I trust the authors** when prompted.

![VSCode Yes, I trust the authors](Misc/vscode-yes-i-trust-the-authors.png)

### 5. Install recommended extensions

Click **Install** to add the recommended VS Code extensions.

![VSCode install recommended extensions](Misc/vscode-install-recommended-extensions.png)

### 6. Reopen the workspace in a Docker container

Click **Reopen in Container**. The first time you do this, it may take up to an hour to set up the container, depending on your machine.

![VSCode Reopen in Container](Misc/vscode-reopen-in-container.png)

## Running Mini-SLAM

From now on, every time you open your Mini-SLAM folder in VS Code, you can immediately choose **Reopen in Container** from the pop-up or via the connect menu in the bottom-left corner: ![Open a Remote Window](Misc/vscode-open-remote-window.png)

You can follow the steps provided in the SLAM course hand-off for each lab and run everything from the terminal. However, this section explains how to make full use of VS Code’s debugging capabilities for your applications (highly recommended).

### 1. Select the target

In the CMake menu, use **Build All Projects** and **Set the Launch/Debug Target** (right-click) for each lab. To define new targets in the future, edit `CMakeLists.txt` inside the `Apps/` folder:

```cmake
set(PROGRAM_NAME mono_tumrgbd)
add_executable(${PROGRAM_NAME} mono_tumrgbd.cc)
target_link_libraries(${PROGRAM_NAME} ${OpenCV_LIBS} mini_slam)
```

![CMake menu](Misc/vscode-cmake-tools.png)

### 2. Launch / Debug

First, download the datasets required for each lab and place the uncompressed folders inside `Datasets/`. Then, follow the guide  
[Debug code with Visual Studio Code](https://code.visualstudio.com/docs/debugtest/debugging).

We already provide two example launch configurations in `.vscode/launch.json`.

You should see two windows similar to the following:

![Mini-SLAM Image and Map viewers](Misc/mini-slam-windows.png)

When you are done developing your application, go to the CMake menu and change the `Configure` setting from `Debug` to `Release`. Rebuild and run your target.

## Troubleshooting

* If you encounter an `error while loading shared libraries`, try running `sudo ldconfig` before executing your application.

* To execute the SLAM system frame by frame, go to `MiniSLAM.cc` and uncomment the following lines:

    ```cpp
    // Uncomment for step by step execution (pressing the Esc key)
    while ((cv::waitKey(10) & 0xEFFFFF) != 27) {
        mapVisualizer_->update();
    }
    ```
