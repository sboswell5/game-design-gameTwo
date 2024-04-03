if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to interact";

	// Interaction checks
	if(keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			if(oInventory.inventory.item_has("key", 1)) {
				oPlayer.x = goto_x;
				oPlayer.y = goto_y;
				room = goto_room;
				oInventory.inventory.item_subtract("key", 1);
			} else {
				m = instance_create_layer(0,0, "Instances", oMessage);
				m.text_message = $"This door is locked!";
			}
		}
	}
}