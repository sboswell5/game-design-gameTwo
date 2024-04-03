if(room == rm_credits) {
	return;
}

if(keyboard_check_pressed(ord("P")) && !oPlayer.typing) {
	global.debug = global.debug ? false : true;
}