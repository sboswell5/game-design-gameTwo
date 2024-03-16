_keyOne = keyboard_check_pressed(ord("1"));
_keyTwo = keyboard_check_pressed(ord("2"));
_keyThree = keyboard_check_pressed(ord("3"));
_keyFour = keyboard_check_pressed(ord("4"));
_keyFive = keyboard_check_pressed(ord("5"));
_keySix = keyboard_check_pressed(ord("6"));
_keySeven = keyboard_check_pressed(ord("7"));
_keyEight = keyboard_check_pressed(ord("8"));
_keyNine = keyboard_check_pressed(ord("9"));
_scrollDown = mouse_wheel_down();
_scrollUp = mouse_wheel_up();

if(_keyOne) {
	selected_slot = 0;
} else if(_keyTwo) {
	selected_slot = 1;
} else if(_keyThree) {
	selected_slot = 2;
} else if(_keyFour) {
	selected_slot = 3;
} else if(_keyFive) {
	selected_slot = 4;
} else if(_scrollDown) {
	if(selected_slot < total_slots - 1) {
		selected_slot += 1;
	}
} else if(_scrollUp) {
	if(selected_slot > 0) {
		selected_slot -= 1;
	}
}

mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);

if(mouse_check_button_pressed(mb_left)) {

	for(i = 0; i < total_slots; i++) {
		box_x = i * (box_padding + box_size) + x_offset + box_padding / 2;
		box_y = y_offset;
		
		
		if(is_between(mx, box_x, box_x + box_size + selected_slot_padding)) {
			if(is_between(my, box_y, box_y + box_size + selected_slot_padding)) {
				selected_slot = i;
				
				inventory_items = inventory.item_get();
				if(inventory_items[i] != noone) {
					moving = inventory_items[i].name;	
				}
			}
		}
		
	}
}

if(mouse_check_button_released(mb_left)) {

	for(i = 0; i < total_slots; i++) {
		box_x = i * (box_padding + box_size) + x_offset + box_padding / 2;
		box_y = y_offset;
		
		if(is_between(mx, box_x, box_x + box_size + selected_slot_padding)) {
			if(is_between(my, box_y, box_y + box_size + selected_slot_padding)) {
				inventory.item_move(selected_slot, i);
				selected_slot = i;
			}
		}
	
		moving = noone;
				
	}
}