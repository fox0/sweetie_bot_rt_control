#
# The find_package macro for Orocos-RTT works best with
# cmake >= 2.6.3
#
cmake_minimum_required(VERSION 2.6.3)

#
# This creates a standard cmake project. You may extend this file with
# any cmake macro you see fit.
#
project(sweetie_bot_servo_inv)

### c++11 support ###
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(LOGGER_DEFAULT "" CACHE STRING "Default logger for all packages (LoggerOCL, LoggerLog4Cpp, LoggerRosout, LoggerRTT).")
set(LOGGER_SERVO_INV "" CACHE STRING "Logger for servo_inv package (LoggerOCL, LoggerLog4Cpp, LoggerRosout, LoggerRTT).")

if (LOGGER_SERVO_INV)
	add_definitions(-DSWEETIEBOT_LOGGER=${LOGGER_SERVO_INV})
elseif(LOGGER_DEFAULT)
	add_definitions(-DSWEETIEBOT_LOGGER=${LOGGER_DEFAULT})
else()
	add_definitions(-DSSWEETIEBOT_LOGGER=LoggerRosout)
endif()

### ROS Dependencies ###
# Find the RTT-ROS package (this transitively includes the Orocos CMake macros)
find_package(catkin REQUIRED COMPONENTS rtt_ros)
include_directories(SYSTEM ${catkin_INCLUDE_DIRS})

### Orocos Dependencies ###
# Note that orocos_use_package() does not need to be called for any dependency
# listed in the package.xml file
include_directories(SYSTEM ${USE_OROCOS_INCLUDE_DIRS})

### Orocos Targets ###

# Include src/ directory.
add_subdirectory( src )

### Orocos Package Exports and Install Targets ###

# Scripts installation
install(DIRECTORY scripts
	DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

# Export package information (replaces catkin_package() macro)
orocos_generate_package(DEPENDS rtt_ros)

if (DEFINED _pkgconfig_error)
if (${_pkgconfig_error})
	message(FATAL_ERROR ${_pkgconfig_error})
endif()
else()
	message(FATAL_ERROR ${_pkgconfig_error})
endif()
