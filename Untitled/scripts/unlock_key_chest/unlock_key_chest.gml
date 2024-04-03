function unlock_key_chest(){
	with(oChest) {
		if(isKeyChest && state == cState.LOCKED) {
			state = cState.WAITING;
			sprite_index = sTreasureChestOpening;
			audio_play_sound(soundChestOpening, 1, false);
		}
	}
}