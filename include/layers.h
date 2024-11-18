#ifndef LAYERS_H
#define LAYERS_H
#include <stdbool.h>
#include <wlr/types/wlr_compositor.h>
//#include <wlr/types/wlr_layer_shell_v1.h>

struct wisteria_layer_popup {
    struct wlr_xdg_popup *xdg_popup;


    struct wl_listener commit;
    struct wl_listener destroy;
};

#endif // !LAYERS_H

