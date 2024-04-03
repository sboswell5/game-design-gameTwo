if(room == rm_credits) {
	return;
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if(!global.debug) {
	oPlayer.typing = false;
}

if(step < 60) {
	step++;	
} else {
	step = 0;	
}

if(oPlayer.typing) {
	if(keyboard_key && keyboard_check_pressed(keyboard_lastkey)) {
		if( array_contains(allowedKeys, keytostring(keyboard_lastkey)) ) {
			inputMessage += keyboard_lastchar;
		}
	}
	if(keyboard_check(vk_backspace)) {
		if(keyDelay < 0) {
			keyDelay = 2;
			if(string_length(inputMessage) > 0) {
				inputMessage = string_delete(inputMessage, string_length(inputMessage), 1);
			}
		} else {
			keyDelay--;
		}
	}
	if(keyboard_check_pressed(vk_enter)) {
		oPlayer.typing = false;
		
		if(inputMessage != "") {
			
			args = string_split(inputMessage, " ");
			
			if(args[0] == "restart") {
				show_debug_message("Restarted")
				room_persistent = false;
				room_restart();
			}
			if(args[0] == "god") {
				oPlayer.godMode = oPlayer.godMode ? false : true;
			}
			else if(args[0] == "restartgame") {
				game_restart();
			}
			else if(args[0] == "unlock") {
				unlock_key_chest();
			} else if(args[0] == "nextroom") {
				if(room_exists(room_next(room))) {
					room_goto_next();	
				}
			} else if(args[0] == "prevroom") {
				if(room_exists(room_previous(room))) {
					room_goto_previous();
				}
			}
			else if(args[0] == "give") {
				amount = 1;
				
				if(array_length(args) >= 3) {
					str = string_digits(args[2]);
					if(string_length(str) > 0) { 
						amount = real(str);
					}
				}
				
				if(array_length(args) >= 2) {
					item = oInventory.inventory.item_add(args[1], amount);
					
					if(item != noone) {
						show_debug_message($"");
						m = instance_create_layer(0,0, "Instances", oMessage);
						m.text_message = $"You got {item.options.displayName}! {amount}x";
					} else {
						m = instance_create_layer(0,0, "Instances", oMessage);
						m.text_message = "Your inventory is full. Remove an item by holding left click on the item and dragging it to the trash";
						show_debug_message($"Failed to get item. Inventory may be full");
					}
					
				} else {
					show_debug_message($"Must provide an item name!");
				}
			}
			else {
		
				show_debug_message($"Unknown command: {args[0]}");
			
			}
		
			inputMessage = "";
			
		}
	}
}

if(mouse_check_button_pressed(mb_left)) {
	if(is_between(mx, x_offset, x_offset + width) && is_between(my, y_offset, y_offset + height)) {
		oPlayer.typing = true;
	} else {
		oPlayer.typing = false;	
	}
}

