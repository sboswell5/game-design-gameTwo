/*
	Edit these variables in the "Creation Code" of the object in the room
*/
rangedObject = -1;
oMaxHealth = 25;
isBoss = true;

idle_sprite = sPolarBearIdle;
walking_sprite = sPolarBear;
hunting_sprite = sPolarBear; // Typically the same as the walking sprite but can be changed
attacking_melee_sprite = sPolarBearAttack;
attacking_ranged_sprite = -1;

// If a sprite is not defined, it will fall back to this one.
// This will typically need to just be the walking sprite
fallback_sprite = sPolarBear;

melee_distance = 50;
damage = 5;

canAttackFromRange = false;

/* 
	Do not change anything after this!
*/
