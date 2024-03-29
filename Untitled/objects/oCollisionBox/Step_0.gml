with(oHurtBox) {
			show_debug_message("LOOP")	
	if(is_overlap(x + x_offset,y + y_offset,x + width + x_offset, y + height + y_offset, other.x, other.y - other.height / 2, other.x + other.width * other.facing, other.y + other.height / 2)) {
			show_debug_message("DMGG")	
			if(damage_object(owner, other.damage)) {
				knockback_object(owner, oPlayer, other.knockback_strength);
			}
		} 
}

instance_destroy();