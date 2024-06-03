add_executable(${PROJECT_NAME}
    main.cpp
)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}
)

target_link_libraries(${PROJECT_NAME}
    freertos_config
    freertos_kernel
    pico_stdlib
)

pico_add_extra_outputs(${PROJECT_NAME})