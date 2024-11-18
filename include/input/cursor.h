#ifndef CURSOR_H
#define CURSOR_H
#include <stdbool.h>
#include <stdint.h>
//#include <wlr/types/wlr_pointer_constraints_v1.h>
#include <wlr/types/wlr_pointer_gestures_v1.h>
#include <wlr/types/wlr_compositor.h>

enum wisteria_cursor_mode {
	TINYWL_CURSOR_PASSTHROUGH,
	TINYWL_CURSOR_MOVE,
	TINYWL_CURSOR_RESIZE,
};


#endif // !CURSOR_H
