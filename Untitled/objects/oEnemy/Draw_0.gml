if(isHurt) {
	shader_set(shdFlashRed);
}

draw_self();

draw_text(x, y - 30, oHealth);
draw_text(x, y - 50, isPlayerOnSamePlatform);
draw_text(x, y - 70, direct);
draw_text(x, y - 90, randomStateTimer);
draw_text(x, y - 120, state);
shader_reset();

if(global.debug) {
		
	dist = point_distance(x, y, oPlayer.x, oPlayer.y);
	_dir = point_direction(x, y, oPlayer.x, oPlayer.y);
	
	current_dist_check = 0;
	isOnSame = true;
	step = sprite_get_width(oPlayer.sprite_index);

	i = 1;
	_x = lengthdir_x(step, _dir);

	while(current_dist_check < dist && isOnSame) {
		
		draw_line(x+_x * i, 0, x+ _x *i, room_height);
		if(!check_vertical_line_collision(x+_x * i, 0, x+ _x * i, room_height,global.collision_objects)) {
				isOnSame = false;
				break;
		}
		current_dist_check+=step;
		i++;
	}
}
