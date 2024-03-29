function getPlayerSprite(state, holding){
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
}