if(isHurt) {
	shader_set(shdFlashRed);
}

draw_self();

shader_reset();


if(global.debug) {

	draw_text(x, y - 30, oHealth);
	draw_text(x, y - 50, isPlayerOnSamePlatform);
	draw_text(x, y - 70, direct);
	draw_text(x, y - 90, randomStateTimer);
	draw_text(x, y - 120, state);
	draw_text(x, y - 140, string(point_distance(oPlayer.x, oPlayer.y, x, y)));
	
	dist = point_distance(x,y, oPlayer.x, oPlayer.y);
	_dir = point_direction(x,y, oPlayer.x, oPlayer.y);
	
	current_dist_check = 0;
	isOnSame = true;
	step = 10;

	i = 1;
	_x = lengthdir_x(step, _dir);

	if(abs(y - oPlayer.y) > sprite_height) {
		isOnSame = false;	
	}

	while(current_dist_check < dist && isOnSame) {
		
		draw_line(x+_x * i, y, x+ _x *i, y + sprite_height);
		if(!check_vertical_line_collision(x+_x * i, y, x+ _x * i, y + sprite_height,global.collision_objects)) {
				isOnSame = false;
				break;
		}
		current_dist_check+=step;
		i++;
	}
	show_debug_message(isOnSame);
	draw_line(x - sprite_width / 2, y, x - sprite_width / 2, y + sprite_height);
}


