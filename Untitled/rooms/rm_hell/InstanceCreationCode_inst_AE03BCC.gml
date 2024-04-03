/*
	Edit these variables in the "Creation Code" of the object in the room
*/
rangedObject = -1; 
oMaxHealth = 10;

idle_sprite = sDevilIdle;
walking_sprite = sDevilWalk;
hunting_sprite = sDevilWalk; // Typically the same as the walking sprite but can be changed
attacking_melee_sprite = sDevilAtk;
attacking_ranged_sprite = -1;

// If a sprite is not defined, it will fall back to this one.
// This will typically need to just be the walking sprite
fallback_sprite = sDevilIdle;

melee_distance = 2;
damage = 7;

canAttackFromRange = false;

/* 
	Do not change anything after this!
*/