if(other.goto_room == -1 || other.goto_x == -1 || other.goto_y == -1) {
	show_debug_message("Room, x, or y variables were not set!");
} else {
	x = other.goto_x;
	y = other.goto_y;
	room = other.goto_room;
}