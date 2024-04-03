/*
	Edit these variables in the "Creation Code" of the object in the room
*/
rangedObject = oAirProjectile; 
oMaxHealth = 10;

idle_sprite = sDemonGorillaIdle;
walking_sprite = sDemonGorillaWalk;
hunting_sprite = sDemonGorillaWalk; // Typically the same as the walking sprite but can be changed
attacking_melee_sprite = sDemonGorillaAtk;
attacking_ranged_sprite = sDemonGorillaAtk;

// If a sprite is not defined, it will fall back to this one.
// This will typically need to just be the walking sprite
fallback_sprite = sDemonGorillaIdle;

melee_distance = 2;
damage = 5;

canAttackFromRange = true;

/* 
	Do not change anything after this!
*/