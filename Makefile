include config.mk

CC = gcc

PKGS      = wayland-server xkbcommon libinput $(XLIBS)
DWLCFLAGS = `$(PKG_CONFIG) --cflags $(PKGS)` $(WLR_INCS) $(DWLCPPFLAGS) $(DWLDEVCFLAGS) $(CFLAGS)
LDLIBS    = `$(PKG_CONFIG) --libs $(PKGS)` $(WLR_LIBS) -lm $(LIBS)


CFLAGS = -std=c11 -Wall -Wextra -Werror -DWLR_USE_UNSTABLE -DWL_HIDE_DEPRECATED
LDFLAGS = $(shell pkg-config --libs wlroots-0.19 pixman-1 wayland-server)
INCLUDES = $(shell pkg-config --cflags wlroots-0.19 pixman-1 wayland-server)

# Files
SRCS = src/main.c
OBJS = $(SRCS:src/%.c=build/%.o)

# Ensure build directory exists
$(shell mkdir -p build)

# Build rules
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)

build/%.o: src/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Clean rule
clean:
	rm -rf build

.PHONY: all clean

