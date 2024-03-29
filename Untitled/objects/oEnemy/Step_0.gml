if(oHealth <= 0) {
	instance_destroy();	
}

if(invincibilityTimer > 0) {
	invincibilityTimer--;
	if(invincibilityTimer <= invincibilityTimeMax - flashForFrames) isHurt = false;
}

if(state == "left") {
	hspeed = -2;
	image_xscale = -abs(image_xscale);
} else if(state == "right") {
	hspeed = 2;	
	image_xscale = abs(image_xscale);
}

if(place_meeting(x + hspeed, y, global.collision_objects)) {
	if(state == "left") {
		state = "right";
	} else {
		state = "left";	
	}
}


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