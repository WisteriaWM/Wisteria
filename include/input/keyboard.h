#ifndef KEYBOARD_H
#define KEYBOARD_H

#include <wlr/types/wlr_keyboard_shortcuts_inhibit_v1.h>
#include <wlr/types/wlr_scene.h>
#include <wlr/types/wlr_seat.h>
#include <wlr/types/wlr_touch.h>
#include <wlr/util/edges.h>
struct wisteria_server;

struct wisteria_keyboard {
	struct wl_list link;
	struct wisteria_server_server *server;
	struct wlr_keyboard *wlr_keyboard;

	struct wl_listener modifiers;
	struct wl_listener key;
	struct wl_listener destroy;
};

#endif // !KEYBOARD_H
