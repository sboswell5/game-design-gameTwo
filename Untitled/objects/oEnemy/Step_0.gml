if(oHealth <= 0) {
	instance_destroy();	
}

if(x < -sprite_height) {
	instance_destroy();	
}

if(invincibilityTimer > 0) {
	invincibilityTimer--;
	if(invincibilityTimer <= invincibilityTimeMax - flashForFrames) isHurt = false;
}

if(direct == "left") {
	image_xscale = abs(image_xscale);
	
	if(state == eState.WANDERING || state == eState.HUNTING) {
		hspeed = -2;	
	} else if(state == eState.IDLE || state == eState.ATTACKING_MELEE ||  state == eState.ATTACKING_RANGED) {
		hspeed = 0;
	}
	
} else if(direct == "right") {
	image_xscale = -abs(image_xscale);
	
	if(state == eState.WANDERING || state == eState.HUNTING) {
		hspeed = 2;	
	} else if(state == eState.IDLE || state == eState.ATTACKING_MELEE ||  state == eState.ATTACKING_RANGED) {
		hspeed = 0;
	}
	
}

if(place_meeting(x + hspeed, y, global.collision_objects)) {
	if(direct == "left") {
		direct = "right";
	} else {
		direct = "left";	
	}
}

/*
if(!place_meeting(x + hspeed, y, global.collision_objects) && !place_meeting(x + hspeed - sprite_width, y + 16, global.collision_objects)) {
	if(direct == "left") {
		direct = "right";	
	} else {
		direct = "left";
	}
}
*/

if(!place_meeting(x + hspeed, y, global.collision_objects) && !place_meeting(x + hspeed - sprite_width, y + 16, global.collision_objects)) {
	if(direct == "left") {
		direct = "right";	
	} else {
		direct = "left";
	}
}


vspd+=grv;

if (place_meeting(x, y+vspd, global.collision_objects)){

	while (abs(vspd) > 0.1) {
		vspd *= 0.5
		if (!place_meeting(x, y + vspd, global.collision_objects)) y += vspd
	}
	
    vspd=0.0;
}

if(randomStateTimer <= 0) {
	
	if(state == eState.WANDERING && irandom_range(0,2) >= 2) {
		state = eState.IDLE;
	} else if(state == eState.IDLE && irandom_range(0,7) >= 1) {
		state = eState.WANDERING;
	} else if(state == eState.HUNTING && irandom_range(0,5) >= 1 && canAttackFromRange) {
		state = eState.ATTACKING_RANGED;
		isRangedAttacking = true;
	}
	
	randomStateTimer = irandom_range(100, randomStateMaxTimer);
} else {
	randomStateTimer--;	
}


if(isPlayerOnSamePlatform && state != eState.ATTACKING_RANGED && state != eState.ATTACKING_MELEE) {
	state = eState.HUNTING;
} else if(!isPlayerOnSamePlatform && state == eState.HUNTING) {
	state = eState.WANDERING;
}

if(state == eState.HUNTING && distance_to_object(oPlayer) < melee_distance) {
	state = eState.ATTACKING_MELEE;
	isMeleeAttacking = true;
}

if(state == eState.HUNTING) {
	if(sprite_exists(hunting_sprite)) {
		sprite_index = hunting_sprite; 
	} else {
		sprite_index = fallback_sprite;
	}
	
	if(oPlayer.x < x) { // Player is on the left
		direct = "left";
	} else {
		direct = "right";
	}
} else if(state == eState.ATTACKING_MELEE) {
	if(sprite_exists(attacking_melee_sprite)) {
		sprite_index = attacking_melee_sprite;
	} else {
		sprite_index = fallback_sprite;
	}
} else if(state == eState.ATTACKING_RANGED) {
	if(sprite_exists(attacking_ranged_sprite)) {
		sprite_index = attacking_ranged_sprite;
	} else {
		sprite_index = fallback_sprite;
	}
} else if(state == eState.IDLE) {
	if(sprite_exists(idle_sprite)) {
		sprite_index = idle_sprite;
	} else {
		sprite_index = fallback_sprite;
	}
} else if(state == eState.WANDERING) {
	if(sprite_exists(walking_sprite)) {
		sprite_index = walking_sprite;
	} else {
		sprite_index = fallback_sprite;
	}
}

if(isMeleeAttacking) {
	damage_object(oPlayer, damage)
	isMeleeAttacking = false;
} else if(isRangedAttacking) {
	if(object_exists(rangedObject)) {
		obj = instance_create_layer(x,y,"Instances", rangedObject);
		obj.direction = point_direction(x,y,oPlayer.x, oPlayer.y - oPlayer.sprite_height / 2);
	}
	isRangedAttacking = false;
}

y+=vspd;

isPlayerOnSamePlatform = is_on_same_platform(x, y);