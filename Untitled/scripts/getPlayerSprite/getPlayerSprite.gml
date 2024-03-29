function getPlayerSprite(state, holding){
	try {
	switch state {
		
		case PlayerState.IDLE:
			switch holding ? holding.name : undefined {
				case "testItem":
					return sPlayerIdleTestItem;
					break;
				default:
					return sPlayerIdle;
			}
		break;
		
		case PlayerState.RUNNING:
			switch holding ? holding.name : undefined {
				case "testItem":
					return sPlayerRunningTestItem;
					break;
				default:
					return sPlayerRunning;
			}
		break;
		
		case PlayerState.ATTACKING:
			switch holding ? holding.name : undefined {
				case "testItem":
					return sPlayerAttackingTestItem;
					break;
				
				default:
					return sPlayerAttacking;
			}
		break;
		
	}
	} catch(e) {
		show_debug_message("Could not find sprite!");
		return sPlayerIdle;
	}
}