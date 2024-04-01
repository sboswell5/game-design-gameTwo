if(keyboard_check_pressed(vk_f1)) {
	global.debug = global.debug ? false : true;
}

if (keyboard_check_pressed(vk_escape)) {
    paused = !paused;
    if (paused == false) {
		instance_activate_all();
		surface_free(paused_surf);
        paused_surf = -1;
    }
}

if (paused == false) {
	instance_activate_all();
}

if(room != rm_paused) lastroom = room;