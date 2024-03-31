function get_item(argument0){
	value = {};
	switch(argument0) {
		
		case "sword":
			value = { sprite: sSword, displayName: "Sword", isAttackable: true, attackType: AttackType.MELEE, attackDamage: 5.0, knockbackStrength: 10.0 };
			break;
		
		case "healingPotion":
			value = { sprite: sHealingPotion, displayName: "Healing Potion", isConsumable: true};
			break;
			
		default: value = { displayName: argument0 };
			
	}
	
	return validateJson(value);
}

function validateJson(_json) {
		requiredJson = { sprite: sDoesNotExists, displayName: "", isConsumable: false, isAttackable: false, attackType: AttackType.NONE, attackDamage: 0.0, knockbackStrength: 0.0, attackWidth: 1, attackHeight: 1 };
		requiredKeys = variable_struct_get_names(requiredJson);
		keys = variable_struct_get_names(_json);

		for(i = 0; i < array_length(requiredKeys); i++) {
			if(!array_contains(keys,requiredKeys[i])) { // Json doesn't have a required key! :(
				struct_set(_json, requiredKeys[i], variable_struct_get(requiredJson, requiredKeys[i]));
			}
		}
		
		return _json;
}