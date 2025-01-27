CC = gcc
CFLAGS = -std=c89 -Wall -Wextra -Wpedantic
LDLIBS = 
DEBUG_FLAGS = -ggdb
RELEASE_FLAGS = -O2

# Directories
SRCDIR = src
OBJDIR = obj

# Source and object files
SRCS = $(wildcard $(SRCDIR)/*.c)
OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))

BUILD ?= debug
ifeq ($(BUILD), debug)
    CFLAGS += $(DEBUG_FLAGS)
else ifeq ($(BUILD), release)
    CFLAGS += $(RELEASE_FLAGS)
endif

TARGET = target.out
