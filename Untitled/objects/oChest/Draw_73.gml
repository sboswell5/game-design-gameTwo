if(isInteractable && !has_been_interacted && collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x_center + x_message_offset, y_center + y_message_offset, interact_message);
	draw_reset();
}

if(state == cState.WAITING) {
	item_sprite = get_item(interact_give_item).sprite;
	draw_sprite(item_sprite, 0, x_center - sprite_get_width(item_sprite) / 2, y_center + y_message_offset * 2);	
}

if(global.debug) {
	draw_circle(x_center, y_center, interact_radius, true);
}