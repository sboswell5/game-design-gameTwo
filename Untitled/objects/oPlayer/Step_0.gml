if(oHealth <= 0) {
	player_died();
	oHealth = oMaxHealth
}

if(invincibilityTimer > 0) {
	invincibilityTimer--;
	if(invincibilityTimer <= invincibilityTimeMax - flashForFrames) isHurt = false;
}

ds_list_clear(walking_on_collisions);

found_deceleration = false;
if(place_meeting(x, y + 1, global.deceleration_objects)) {
	instance_place_list(x, y + 1, global.deceleration_objects, walking_on_collisions, true);
	if(!ds_list_empty(walking_on_collisions)) {
		for(i = 0; i < ds_list_size(walking_on_collisions); i++) {	
			if(variable_instance_exists(ds_list_find_value(walking_on_collisions, i).id, "deceleration_speed")) {
				current_deceleration = variable_instance_get(ds_list_find_value(walking_on_collisions, i).id, "deceleration_speed");
				found_deceleration = true;
				break;
			}
		}
	}
}

if(!found_deceleration) {
	current_deceleration = default_deceleration;
}

if(!typing) {

	if (can_jump-- > 0 && keyboard_check(global.jump_key)){
		can_jump = 0;
	    vspd = vspdJump;
		state = PlayerState.JUMPING;
	}

	if (keyboard_check(global.right_key)){
	    hspd += current_deceleration;
	}

	if (keyboard_check(global.left_key)){
	    hspd -= current_deceleration;
	}
	
}

if (!keyboard_check(global.left_key) && !keyboard_check(global.right_key)){
	if(place_meeting(x, y+1, global.collision_objects)) { // Remove if we want player to always slow hspd
		if(hspd > 0.0) { // +
			if(hspd > current_deceleration) {
				hspd -= current_deceleration;
			} else {
				hspd = 0.0;
			}
		} else if(hspd < 0.0) { // -
			if(hspd < current_deceleration) {
				hspd += current_deceleration;
			} else {
				hspd = 0.0;
			}
		}
	}
}

hspd = clamp(hspd, -maxhspd, maxhspd);
//hspd doesn't exceed the maximum movement speed
vspd += grv

if (place_meeting(x+hspd, y, global.collision_objects)){
	while (abs(hspd) > 0.1) {
		hspd *= 0.5
		if (!place_meeting(x + hspd, y, global.collision_objects)) x += hspd
	}
	
    hspd=0.0;
}

x+=hspd;

if (place_meeting(x, y+vspd, global.collision_objects)){
	if(vspd > 0.0) {
		can_jump = 10;
		if(state == PlayerState.JUMPING) state = PlayerState.IDLE;
	}

	while (abs(vspd) > 0.1) {
		vspd *= 0.5
		if (!place_meeting(x, y + vspd, global.collision_objects)) y += vspd
	}
	
    vspd=0.0;
}


y+=vspd;

if(( keyboard_check(global.left_key) || keyboard_check(global.right_key) ) && state != PlayerState.ATTACKING && state != PlayerState.JUMPING) {
	state = PlayerState.RUNNING;	
} else if(state != PlayerState.ATTACKING && state != PlayerState.JUMPING) {
	state = PlayerState.IDLE;	
}

if(keyboard_check(global.right_key)) {
	image_xscale = abs(image_xscale);
} else if( keyboard_check(global.left_key)) {
	image_xscale = -abs(image_xscale);
}

if(holding != undefined && mouse_check_button_pressed(mb_left) && state != PlayerState.ATTACKING) {
	if(holding.options.isAttackable) {
		
		state = PlayerState.ATTACKING;
		
		if(holding.options.attackType == AttackType.MELEE) {
			
			cBox = instance_create_layer(x,y,"Instances", oCollisionBox);
			
			//cBox.width = holding.options.attackWidth
			//cBox.height = holding.options.attackHeight;
			cBox.width = 96;
			cBox.height = sprite_height;
			cBox.facing = sign(image_xscale);
			cBox.knockback_strength = holding.options.knockbackStrength;
			cBox.damage =  holding.options.attackDamage + (holding.options.attackDamage * attackBoost);
			
		} else if(holding.options.attackType == AttackType.RANGED) {
			// No time to add this :(
		}
	} else if(holding.options.isConsumable){
		
		if(holding.name == "healingPotion") {
			healingAmount = 15;
			oInventory.inventory.item_subtract("healingPotion", 1);
			heal_object(self, healingAmount);
		}
		else if(holding.name = "fireBean"){
			attackBoost = 0.75;
			attackBoostTimer = 1500;
			oInventory.inventory.item_subtract("fireBean",1);
		
			m = instance_create_layer(0,0, "Instances", oMessage);
			item = get_item("fireBean");
			m.text_message = $"You have consumed a {item.displayName} and recieved {attackBoost*100}% more damage for a few seconds!";
		}
		else if(holding.name = "iceBean"){
			attackBoost = 0.5;
			attackBoostTimer = 1500;
			oInventory.inventory.item_subtract("iceBean",1);
			
			m = instance_create_layer(0,0, "Instances", oMessage);
			item = get_item("iceBean");
			m.text_message = $"You have consumed a {item.displayName} and recieved {attackBoost*100}% more damage for a few seconds!";
			
		}
	}
}

//sprite_index = getPlayerSprite(state, holding); DOTO: Remove comment once we have player sprites
sprite_test = getPlayerSprite(state, holding);
try {
	if(sprite_exists(sprite_test)) {
		sprite_index = sprite_test;
	}
} catch(e) {
	
}

if(sprite_index != sPlayerJumping && sprite_index != sPlayerJumpingSword){
	image_speed = 1;
}

if(attackBoostTimer < 0) {
	attackBoost = 0;
} else {
	attackBoostTimer--;	
}


if(y > room_height + sprite_height) {
	if(room == rm_jungle) {
		x = 80;
		y = 520;
	} else if(room == rm_ice) {
		
	}
	show_debug_message("DIED");
}