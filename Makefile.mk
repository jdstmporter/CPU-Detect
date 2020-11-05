#!/usr/bin/make -f
# Makefile template for CPU detection with arm.py
#

# Set compilers
#
CC  := gcc
CXX := g++

# Determine CPU architecture and set appropriate flags for maths, FPU, etc
#
mkfile_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CPU_FLAGS := $(shell $(mkfile_path)../arm.py)

# Set C / C++ dialects (vary as required)
#
C_DIALECT := -std=c99
CXX_DIALECT := std=c++17

# Debug flags: hoose whichever one you need
#
DEBUG_FLAGS = -DNDEBUG
#DEBUG_FLAGS = -g3

# Common compiler flags
#
BASE_FLAGS  = -O3 -ffast-math -Wall -Wextra -DNDEBUG -fPIC

# Set the C and C++ compiler flags for this CPU
#
C_FLAGS   = $(BASE_FLAGS) $(C_DIALECT) $(CPU_FLAGS)
CXX_FLAGS = $(BASE_FLAGS) $(CXX_DIALECT) $(CPU_FLAGS)

# ...
