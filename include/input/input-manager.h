#ifndef INPUT_MANAGER_H
#define INPUT_MANAGER_H
#include <libinput.h>
#include <wlr/types/wlr_keyboard_shortcuts_inhibit_v1.h>
#include <wlr/types/wlr_virtual_keyboard_v1.h>
#include <wlr/types/wlr_virtual_pointer_v1.h>
#include <wlr/types/wlr_transient_seat_v1.h>

struct wisteria_server;

struct wisteria_input_device {
	char *identifier;
	struct wlr_input_device *wlr_device;
	struct wl_list link;
	struct wl_listener device_destroy;
	bool is_virtual;
};

struct wisteria_input_manager {
    
	struct wl_list devices;
	struct wl_list seats;

	struct wlr_keyboard_shortcuts_inhibit_manager_v1 *keyboard_shortcuts_inhibit;
	struct wlr_virtual_keyboard_manager_v1 *virtual_keyboard;
	struct wlr_virtual_pointer_manager_v1 *virtual_pointer;
	struct wlr_pointer_gestures_v1 *pointer_gestures;
	struct wlr_transient_seat_manager_v1 *transient_seat_manager;

	struct wl_listener new_input;
	struct wl_listener inhibit_activate;
	struct wl_listener inhibit_deactivate;
	struct wl_listener keyboard_shortcuts_inhibit_new_inhibitor;
	struct wl_listener virtual_keyboard_new;
	struct wl_listener virtual_pointer_new;
	struct wl_listener transient_seat_create;
};

#endif // !INPUT_MANAGER_H
