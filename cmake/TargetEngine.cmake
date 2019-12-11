add_library(Engine SHARED)

include(EngineSourceList)

add_library(Engine::Engine ALIAS Engine)

find_package(glm 0.9.9 REQUIRED)
target_link_libraries(Engine 
    PUBLIC
    glm
)

find_package(enet 1.3.14 REQUIRED)

target_link_libraries(Engine 
    PUBLIC
    enet
)

target_include_directories(Engine
    PRIVATE 
    ${CMAKE_CURRENT_SOURCE_DIR}
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
    PUBLIC
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/third_party/enet/include>
)

set_target_properties( Engine
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/libs"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/libs"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)

if(WIN32)
    target_link_libraries(Engine 
        PRIVATE
        ws2_32.lib
        winmm.lib
    )
endif()

SetCppVersionOfTarget(Engine)