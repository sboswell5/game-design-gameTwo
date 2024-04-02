function player_died(){
	if(room == rm_jungle) {
		x = 80;
		y = 520;
	} else if(room == rm_ice) {

	}
	show_debug_message("DIED");
	m = instance_create_layer(0,0, "Instances", oMessage);
	m.text_message = "You died! :(";
}