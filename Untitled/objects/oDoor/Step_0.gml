if(distance_to_object(oPlayer) <= 16) {
	if(goto_room == -1 || goto_x == -1 || goto_y == -1) {
		show_debug_message("Room, x, or y variables were not set!");
	} else {
		show_debug_message("going to room!")
		oPlayer.x = goto_x;
		oPlayer.y = goto_y;
		room = goto_room;
	}
	}
