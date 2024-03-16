if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to interact";
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {

			item = oInventory.inventory.item_add(interact_give_item, interact_give_item_amount);
			if(item != noone) {
				show_debug_message("Interacted!");
				has_been_interacted = true;
			} else {
				// TODO: Drop item on ground?
				show_debug_message("Failed to give item. Inventory may be full :(");	
			}
		}
	}
}