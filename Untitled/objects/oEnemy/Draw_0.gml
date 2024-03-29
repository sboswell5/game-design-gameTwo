if(isHurt) {
	shader_set(shdFlashRed);
}

draw_self();

draw_text(x, y - 30, oHealth);
shader_reset();