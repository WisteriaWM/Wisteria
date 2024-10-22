include config.mk

# Targets
all: clean build

build : $(BUILD_DIR)/$(TARGET)

# Wayland scanner for protocol headers
#
# From tinywl makefile: https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/master/tinywl/Makefile
# # wayland-scanner is a tool which generates C headers and rigging for Wayland
# protocols, which are specified in XML. wlroots requires you to rig these up
# to your build system yourself and provide them in the include path.
$(INCLUDE_DIR)/xdg-shell-protocol.h:
	@mkdir -p $(INCLUDE_DIR)
	$(WAYLAND_SCANNER) server-header \
		$(WAYLAND_PROTOCOLS)/stable/xdg-shell/xdg-shell.xml $@

# Compile WisteriaWM object
$(BUILD_DIR)/wisteriawm.o: $(SRC_DIR)/wisteriawm.c $(INCLUDE_DIR)/xdg-shell-protocol.h
	@mkdir -p $(BUILD_DIR)
	$(CC) -c $< -g -Werror $(CFLAGS) -I$(INCLUDE_DIR) -DWLR_USE_UNSTABLE -o $@

# Link WisteriaWM executable
$(BUILD_DIR)/$(TARGET): $(BUILD_DIR)/wisteriawm.o
	$(CC) $^ -g -Werror $(CFLAGS) -I$(INCLUDE_DIR) $(LDFLAGS) $(LIBS) -o $@

# Clean build directory
clean:
	rm -rf $(BUILD_DIR) $(INCLUDE_DIR)/xdg-shell-protocol.h

.PHONY: all clean build
