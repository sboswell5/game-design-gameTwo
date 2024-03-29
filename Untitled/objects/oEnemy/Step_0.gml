if(state == "left") {
	hspeed = -2;
	image_xscale = -1;
} else if(state == "right") {
	hspeed = 2;	
	image_xscale = 1;
}

if(place_meeting(x + hspeed, y, global.collision_objects)) {
	if(state == "left") {
		state = "right";
	} else {
		state = "left";	
	}
}

show_debug_message(place_meeting(x + hspeed + 32, y + 3, global.collision_objects));

if(!place_meeting(x + hspeed, y, global.collision_objects) && !place_meeting(x + hspeed * 16, y + 16, global.collision_objects)) {
	if(state == "left") {
		state = "right";	
	} else {
		state = "left";
	}
}

vspd+=grv;

if (place_meeting(x, y+vspd, global.collision_objects)){
	if(vspd > 0.0) can_jump = 10;

	while (abs(vspd) > 0.1) {
		vspd *= 0.5
		if (!place_meeting(x, y + vspd, global.collision_objects)) y += vspd
	}
	
    vspd=0.0;
}


y+=vspd;