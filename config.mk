CC=gcc
CFLAGS=-std=c89 -I$(INCDIR) -Wall -Wextra -Wpedantic
LDLIBS=
DEBUG_FLAGS = -ggdb3
RELEASE_FLAGS = -O2

# Default build is debug
BUILD ?= debug

ifeq ($(BUILD), debug)
    CFLAGS += $(DEBUG_FLAGS)
else ifeq ($(BUILD), release)
    CFLAGS += $(RELEASE_FLAGS)
else
    $(error Invalid BUILD value)
endif

# Test source files
TESTSRCS = $(wildcard tests/*.c)

# Test executables
TESTS = $(TESTSRCS:.c=)

# Directories
SRCDIR = src
INCDIR = $(SRCDIR)/include
OBJDIR = obj

SRCS = $(wildcard $(SRCDIR)/*.c)
OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))
INCS = $(wildcard $(INCDIR)/*.h)

TARGET=target.out
