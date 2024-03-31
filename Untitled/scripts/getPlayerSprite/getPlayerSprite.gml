function getPlayerSprite(state, holding){
	try {
	switch state {
		
		case PlayerState.IDLE:
			switch holding ? holding.name : undefined {
				case "sword":
					return sPlayerIdleSword;
					break;
				default:
					return sPlayerIdle;
			}
		break;
		
		case PlayerState.RUNNING:
			switch holding ? holding.name : undefined {
				case "sword":
					return sPlayerRunningSword;
					break;
				default:
					return sPlayerRunning;
			}
		break;
		
		case PlayerState.ATTACKING:
			switch holding ? holding.name : undefined {
				case "sword":
					return sPlayerAttackingSword;
					break;
				
				default:
					return sPlayerAttackingSword;
			}
		break;
		
		case PlayerState.JUMPING:
			switch holding ? holding.name : undefined {
				case "sword":
					return sPlayerJumpingSword;
					break;
				
				default:
					return sPlayerJumping;
			}
		break;
		
	}
	} catch(e) {
		show_debug_message("Could not find sprite!");
		return sPlayerIdle;
	}
}