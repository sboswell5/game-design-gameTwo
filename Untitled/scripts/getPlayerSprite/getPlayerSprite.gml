function getPlayerSprite(state, holding){
	switch state {
		
		case PlayerState.IDLE:
			switch holding ? holding.name : undefined {
				case "testItem":
					//return sPlayerIdleTestItem;  DOTO: Remove comment once we have player sprites
					return "sPlayerIdleTestItem";
					break;
				default:
					return "sPlayerIdle";
			}
		break;
		
		case PlayerState.RUNNING:
			switch holding ? holding.name : undefined {
				case "testItem":
					//return sPlayerRunningTestItem; DOTO: Remove comment once we have player sprites
					return "sPlayerRunningTestItem";
					break;
				default:
					//return sPlayerRunning; DOTO: Remove comment once we have player sprites
					return "sPlayerRunning";
			}
		break;
		
		case PlayerState.ATTACKING:
			switch holding ? holding.name : undefined {
				case "testItem":
					//return sPlayerAttackingTestItem; DOTO: Remove comment once we have player sprites
					return "sPlayerAttackingTestItem";
					break;
				
				default:
					//return sPlayerAttacking; DOTO: Remove comment once we have player sprites
					return "sPlayerAttacking";
			}
		break;
		
	}
}