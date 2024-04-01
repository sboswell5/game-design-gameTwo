if(isHurt) {
	shader_set(shdFlashRed);
}

draw_self();
shader_reset();

if(global.debug) {
	draw_text(x, y - 30, string(current_deceleration));
	draw_text(x, y - 50, string(hspd));
	draw_text(x, y - 70, string(sprite_test));
	draw_text(x, y - 90, string(holding));
	draw_text(x, y - 110, string(attackBoost));
	draw_text(x, y - 130, string(attackBoostTimer));
}