function unlock_key_chest(){
	with(oChest) {
		if(isKeyChest && state == cState.LOCKED) {
			state = cState.WAITING;
			sprite_index = sTreasureChestOpening;
		}
	}
}