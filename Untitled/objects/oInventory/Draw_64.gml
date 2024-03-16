if(!shown) {
	return;
}

inventory_items = inventory.item_get();

for(i = 0; i < array_length(inventory_items); i++) {
	
	box_x = i * (box_padding + box_size) + x_offset + box_padding / 2;
	box_y = y_offset;
	
	if(i == selected_slot) {
		box_y += selected_slot_yoffset;
		draw_sprite(sInventorySelectedItemBox, 0, box_x, box_y);
		//draw_rectangle_color(box_x - selected_slot_padding, box_y - selected_slot_padding, box_x + box_size + selected_slot_padding, box_y + box_size + selected_slot_padding, selected_bgd_color, selected_bgd_color, selected_bgd_color, selected_bgd_color, false);
	} else {
		draw_sprite(sInventoryItemBox, 0, box_x, box_y);
	}
	
		
	// Check if selected slot has an item, if so, make the player hold it
	// If not, set players holding_name and holding_sprite to noone
	if(i == selected_slot) {
		// Dont change oPlayer.holding if it is currently the same
		if(!((inventory_items[i] == noone && oPlayer.holding == undefined) || (inventory_items[i] == oPlayer.holding))) {
			
			if(inventory_items[i] != noone) { // Has item
				oPlayer.holding = inventory_items[i]
			} else { // Doesn't have item
				oPlayer.holding = undefined;
			}
			
		}
	}
	draw_reset();
}


for(i = 0; i < array_length(inventory_items); i++) {
	if(inventory_items[i] == noone) continue;
	
	box_x = i * (box_padding + box_size) + x_offset + box_padding / 2;
	box_y = y_offset;
	
	if(i == selected_slot && moving != noone && moving == inventory_items[i].name) {
		
		draw_set_color(#232323);
		draw_set_alpha(1);
		draw_circle(
			mx - sprite_get_width(inventory_items[i].options.sprite) + box_size - padding / 2,
			my - sprite_get_height(inventory_items[i].options.sprite) + box_size,
			10,
			false
		);
			
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center)
			
		draw_text(
			mx - sprite_get_width(inventory_items[i].options.sprite) + box_size - padding / 2,
			my - sprite_get_height(inventory_items[i].options.sprite) + box_size,
			inventory_items[i].quantity
		);
		
	} else {
		
		draw_set_color(#232323);
		draw_set_alpha(1);
		draw_circle(
			box_x + box_size - padding / 2,
			box_y + box_size,
			10,
			false
		);
			
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center)
			
		draw_text(
			box_x + box_size - padding / 2,
			box_y + box_size,
			inventory_items[i].quantity
		);
	
	}

	if(i == selected_slot && moving != noone && moving == inventory_items[i].name) {
		draw_sprite(inventory_items[i].options.sprite, 0, mx - sprite_get_width(inventory_items[i].options.sprite) / 2, my - sprite_get_height(inventory_items[i].options.sprite) / 2);
	} else if(i == selected_slot) {
		draw_sprite(inventory_items[i].options.sprite, 0, box_x + sprite_get_width(inventory_items[i].options.sprite) / 2, box_y + selected_slot_yoffset + sprite_get_height(inventory_items[i].options.sprite) / 2);
	} else {
		draw_sprite(inventory_items[i].options.sprite, 0, box_x + sprite_get_width(inventory_items[i].options.sprite) / 2, box_y + sprite_get_height(inventory_items[i].options.sprite) / 2);	
	}
	
	for(s = 0; s < total_slots; s++) {
		if(inventory_items[s] == noone) continue;
		box_x = s * (box_padding + box_size) + x_offset + box_padding / 2;
		box_y = y_offset;
		
		
		if(is_between(mx, box_x, box_x + box_size + selected_slot_padding)) {
			if(is_between(my, box_y, box_y + box_size + selected_slot_padding)) {
				if(moving != inventory_items[s].name) {
					draw_text(box_x + box_size / 2, box_y, inventory_items[s].options.displayName);
				}
			}
		}
	
		
	}
	
	draw_reset();
}
