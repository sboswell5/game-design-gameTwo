function is_on_same_platform(x,y, step = 10){
	dist = point_distance(oPlayer.x, oPlayer.y, x, y);
	dir = point_direction(oPlayer.x, oPlayer.y, x, y);
	
	current_dist_check = 0;
	isOnSame = true;
	
	i = 1;
	_x = lengthdir_x(step, dir);

	while(current_dist_check < dist && isOnSame) {
		
		draw_line(x+_x * i, y, x+ _x *i, y + sprite_height);
		if(!check_vertical_line_collision(oPlayer.x +_x * i, oPlayer.y, oPlayer.x + _x * i, oPlayer.y + oPlayer.sprite_height, global.collision_objects)) {
				isOnSame = false;
				break;
		}
		current_dist_check+=step;
		i++;
	}
	return isOnSame;
}

