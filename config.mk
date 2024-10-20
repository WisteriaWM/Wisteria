VERSION = 0.0.1-dev
# Target executable
TARGET = build/WisteriaWM-$(VERSION)

WLR_INCS = `$(PKG_CONFIG) --cflags wlroots-0.19`
WLR_LIBS = `$(PKG_CONFIG) --libs wlroots-0.19`

