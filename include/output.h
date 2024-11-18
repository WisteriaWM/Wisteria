#ifndef OUTPUT_H
#define OUTPUT_H

#include <time.h>
#include <unistd.h>
#include <wayland-server-core.h>
#include <wlr/types/wlr_damage_ring.h>
#include <wlr/types/wlr_output.h>
#include <wlr/types/wlr_scene.h>

struct wisteria_server;

struct tinywl_output {
	struct wl_list link;
	struct wisteria_server *server;
	struct wlr_output *wlr_output;
	struct wl_listener frame;
	struct wl_listener request_state;
	struct wl_listener destroy;
};

#endif // !OUTPUT_H
