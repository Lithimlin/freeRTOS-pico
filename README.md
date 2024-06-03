# FreeRTOS + Pico-SDK Project Template

To build this project, install the required packages listed in
[this guide](https://learn.arm.com/learning-paths/microcontrollers/rpi_pico/sdk/).
It is **not** necessary to download and run the `pico_setup.sh`.
CMake will take care of that later.
Currently (`2024-06-03`), these packages are:
```
arm-none-eabi-gcc
gdb-multiarch
cmake
openocd
```
It might be necessary to also install the `arm-none-eabi-newlib` (or a similarly named) package.
**No** environment variables need to be set.

We then recommend using VS Code with the CMake extension.
There, select an `unspecified/__unspec__` kit for configuration.
The Pico-SDK will handle the necessary cross compilation.
