cmake_minimum_required(VERSION 3.25)

project(BisonFlex LANGUAGES C)

set(CMAKE_CXX_STANDARD 17)

find_package(BISON 3.8 REQUIRED)
find_package(FLEX 2.6 REQUIRED)

add_subdirectory(Scanner)
add_subdirectory(Parser)