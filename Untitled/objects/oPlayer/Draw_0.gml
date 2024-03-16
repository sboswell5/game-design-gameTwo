draw_self();

if(global.debug) {
	draw_text(x, y - 30, string(current_deceleration));
	draw_text(x, y - 50, string(hspd));
}