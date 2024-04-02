function is_on_same_platform(x,y, step = 10){
	dist = point_distance(oPlayer.x, oPlayer.y, x, y);
	dir = point_direction(oPlayer.x, oPlayer.y, x, y);
	
	current_dist_check = 0;
	isOnSame = true;
	
	_x = lengthdir_x(step, dir);
	_y = lengthdir_y(step, dir);
	i = 1;
		
	while(current_dist_check < dist && isOnSame) {
		
		if(!check_vertical_line_collision(oPlayer.x+_x * i,oPlayer.y+_y * i, oPlayer.x+ _x * i, room_height, global.collision_objects)) {
				isOnSame = false;
		}
		current_dist_check+=step;
		i++;
	}
	return isOnSame;
}

