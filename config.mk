VERSION=0.0.1-dev

# Target executable
TARGET=WisteriaWM-$(VERSION)

# Configuration
PKG_CONFIG?=pkg-config
WAYLAND_PROTOCOLS!=$(PKG_CONFIG) --variable=pkgdatadir wayland-protocols
WAYLAND_SCANNER!=$(PKG_CONFIG) --variable=wayland_scanner wayland-scanner
PKGS = wlroots-0.19 wayland-server xkbcommon
CFLAGS_PKG_CONFIG!=$(PKG_CONFIG) --cflags $(PKGS)
CFLAGS+=$(CFLAGS_PKG_CONFIG)
LIBS!=$(PKG_CONFIG) --libs $(PKGS)
SRC_DIR=src
INCLUDE_DIR=include
BUILD_DIR=build
