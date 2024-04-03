/*
	Edit these variables in the "Creation Code" of the object in the room
*/
rangedObject = oBananaProjectile; 
oMaxHealth = 40;
isBoss = true;

idle_sprite = sBaboon;
walking_sprite = sBaboonWalk;
hunting_sprite = -1; // Typically the same as the walking sprite but can be changed
attacking_melee_sprite = -1;
attacking_ranged_sprite = -1;

// If a sprite is not defined, it will fall back to this one.
// This will typically need to just be the walking sprite
fallback_sprite = sBaboonWalk;

melee_distance = 70;
damage = 5;

canAttackFromRange = true;

/* 
	Do not change anything after this!
*/