CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT("love-nuklear" C)

SET(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

SET(LIB_NAME "nuklear")

ADD_LIBRARY(
	"${LIB_NAME}"
	MODULE
	src/nuklear/nuklear.h
	src/nuklear_love.c
)

TARGET_INCLUDE_DIRECTORIES(
	"${LIB_NAME}"
	PUBLIC
	"../lua-5.1.5/src"
)

TARGET_LINK_LIBRARIES(
	"${LIB_NAME}"
	"../../../build/lua51/Debug/lua51"
)

SET_TARGET_PROPERTIES("${LIB_NAME}" PROPERTIES PREFIX "")
