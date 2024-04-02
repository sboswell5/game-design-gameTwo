function check_vertical_line_collision(from_x,from_y,to_x,to_y,objs){
	return collision_line(from_x, from_y, to_x, to_y, objs, false, true) != noone;
}