# File docs: https://github.com/FreeRTOS/FreeRTOS-Kernel#consume-with-cmake
include(FetchContent)
set(FETCHCONTENT_BASE_DIR_SAVE ${FETCHCONTENT_BASE_DIR})
# Fetch FreeRTOS-Kernel
FetchContent_Declare( freertos_kernel
  GIT_REPOSITORY https://github.com/FreeRTOS/FreeRTOS-Kernel.git
  GIT_TAG        V11.1.0 #Note: Best practice to use specific git-hash or tagged version
  GIT_SUBMODULES_RECURSE FALSE
)

# Add config file
add_library(freertos_config INTERFACE)

target_include_directories(freertos_config SYSTEM
INTERFACE
    config
)

target_compile_definitions(freertos_config
  INTERFACE
    projCOVERAGE_TEST=0
)

# Set variables
set(FREERTOS_HEAP "4" CACHE STRING "" FORCE)
set(FREERTOS_PORT "GCC_RP2040" CACHE STRING "" FORCE)
# Select the native compile PORT
# set(FREERTOS_PORT "TEMPLATE" CACHE STRING "" FORCE)

# Cross-Compile options
target_compile_definitions(freertos_config INTERFACE ${definitions})
target_compile_options(freertos_config INTERFACE ${options})
# Set try_compile to static library mode
# see https://cmake.org/cmake/help/latest/variable/CMAKE_TRY_COMPILE_TARGET_TYPE.html
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

message("Downloading Free RTOS")
FetchContent_MakeAvailable(freertos_kernel)

message("Importing FreeRTOS RP2040 Kernel")
set(FREERTOS_KERNEL_PATH ${freertos_kernel_SOURCE_DIR})
set(PICO_SDK_FETCH_FROM_GIT "ON")
include(${FREERTOS_KERNEL_PATH}/portable/ThirdParty/GCC/RP2040/FreeRTOS_Kernel_import.cmake)