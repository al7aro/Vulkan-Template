cmake_minimum_required(VERSION 3.4...3.28 FATAL_ERROR)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(WORKSPACE_NAME "WorkspaceName")
project(${WORKSPACE_NAME})

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${WORKSPACE_NAME})

#################### SOURCES ####################
file(GLOB_RECURSE ALL_SOURCES
    "./src/*.cpp"
    "./src/*.hpp"
    "./src/*.c"
    "./src/*.h"
)
add_executable(${WORKSPACE_NAME} ${ALL_SOURCES})
#################################################

#################### LIBS ####################
# GLFW
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
add_subdirectory("vendor/glfw")
target_link_libraries(${WORKSPACE_NAME} glfw)
target_include_directories(${WORKSPACE_NAME} PUBLIC "vendor/glfw/include")
# stb
add_subdirectory("vendor/stb")
target_link_libraries(${WORKSPACE_NAME} stb)
target_include_directories(${WORKSPACE_NAME} PUBLIC "vendor/stb/include")
# GLM
add_subdirectory("vendor/glm")
target_link_libraries(${WORKSPACE_NAME} glm)
target_include_directories(${WORKSPACE_NAME} PUBLIC "vendor/glm")
# OpenGL
find_package(Vulkan REQUIRED)
target_link_libraries(${WORKSPACE_NAME} Vulkan::Vulkan)
##############################################