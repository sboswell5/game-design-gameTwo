function get_item(argument0){
	value = {};
	switch(argument0) {
		
		case "sword":
			value = { sprite: sSword, displayName: "Sword", isAttackable: true, attackType: AttackType.MELEE, attackDamage: 5.0, knockbackStrength: 10.0, extraMessage: "Press Left Click to attack!" };
			break;
		
		case "key":
			value = { sprite: sKey, displayName: "Key", extraMessage: "This can be used to open doors!"};
			break;
		case "healingPotion":
			value = { sprite: sHealingPotion, displayName: "Healing Potion", isConsumable: true, extraMessage: "Press Left Click while holding to heal yourself!"};
			break;
			
		case "bean":
			value = {sprite: sBean, displayName: "Bean", isConsumable: true, extraMessage: "Press Left Click while holding to gain a damage buff!"};
			break;
			
		case "fireBean":
			value = {sprite: sFireBean, displayName: "Bean", isConsumable: true, extraMessage: "Press Left Click while holding to gain a damage buff!"};
			break;
		
		case "iceBean":
			value = {sprite: sIceBean, displayName: "Bean", isConsumable: true, extraMessage: "Press Left Click while holding to gain a damage buff!"};
			break;
			
		default: value = { displayName: argument0 };
			
	}
	
	return validateJson(value);
}

function validateJson(_json) {
		requiredJson = { sprite: sDoesNotExists, displayName: "", isConsumable: false, isAttackable: false, attackType: AttackType.NONE, attackDamage: 0.0, knockbackStrength: 0.0, extraMessage: "" };
		requiredKeys = variable_struct_get_names(requiredJson);
		keys = variable_struct_get_names(_json);

		for(i = 0; i < array_length(requiredKeys); i++) {
			if(!array_contains(keys,requiredKeys[i])) { // Json doesn't have a required key! :(
				struct_set(_json, requiredKeys[i], variable_struct_get(requiredJson, requiredKeys[i]));
			}
		}
		
		return _json;
}