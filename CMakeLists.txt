cmake_minimum_required(VERSION 3.17)

set(PICO_SDK_VERSION_MAJOR 1)
set(PICO_SDK_VERSION_MINOR 5)
set(PICO_SDK_VERSION_REVISION 1)
set(PICO_SDK_VERSION_STRING "1.5.1")

project(freeRTOS-pico C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Import FreeRTOS
message("Importing FreeRTOS")
include(free_rtos_import.cmake)
# # Import (optional) extra Pico libraries
# set(PICO_EXTRAS_FETCH_FROM_GIT "ON")
# include(pico_extras_import_optional.cmake)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

# rest of your project
add_subdirectory(src)

# add_subdirectory(lib)