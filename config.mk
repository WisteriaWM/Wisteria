#Version
VERSION=0.0.1-dev
##TODO: Set version from git tag

CC = cc

# Target executable
TARGET=WisteriaWM-$(VERSION)

# Configuration
PKG_CONFIG?=pkg-config

#Wayland protocol
WAYLAND_PROTOCOLS!=$(PKG_CONFIG) --variable=pkgdatadir wayland-protocols
WAYLAND_SCANNER!=$(PKG_CONFIG) --variable=wayland_scanner wayland-scanner

#Flags
PKGS=wlroots-0.19 wayland-server xkbcommon
CFLAGS_PKG_CONFIG!=$(PKG_CONFIG) --cflags $(PKGS)
CFLAGS+=$(CFLAGS_PKG_CONFIG)
LIBS!=$(PKG_CONFIG) --libs $(PKGS)


#Directories
SRC_DIR=src
INCLUDE_DIR=include
BUILD_DIR=build
