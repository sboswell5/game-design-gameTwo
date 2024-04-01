if(isInteractable) {
	if(state == cState.UNOPENED) {
		interact_message = $"Press \"{keytostring(global.interact_key)}\" to interact";
	} else if(state == cState.WAITING) {
		interact_message = $"Press \"{keytostring(global.interact_key)}\" to pick up item";
	}
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			
			if(state == cState.UNOPENED) {
				state = cState.WAITING;
				sprite_index = sTreasureChestOpening;
			} else if(state == cState.WAITING) {
				item = oInventory.inventory.item_add(interact_give_item, interact_give_item_amount);
				
				if(item != noone) {
					
					show_debug_message("Interacted!");
					has_been_interacted = true;
					
					state = cState.OPENED;
					
					m = instance_create_layer(0,0, "Instances", oMessage);
					m.text_message = $"You have collected {interact_give_item_amount} {item.options.displayName}";
				} else {
					m = instance_create_layer(0,0, "Instances", oMessage);
					m.text_message = "Your inventory is full. Remove an item by holding left click on the item and dragging it to the trash";
					show_debug_message("Failed to give item. Inventory may be full :(");	
				}
			}
			
			
		}
	}
}
