/*
	Edit these variables in the "Creation Code" of the object in the room
*/
rangedObject = -1;
oMaxHealth = 10;

idle_sprite = -1;
walking_sprite = sSnowball;
hunting_sprite = -1; // Typically the same as the walking sprite but can be changed
attacking_melee_sprite = -1;
attacking_ranged_sprite = -1;

// If a sprite is not defined, it will fall back to this one.
// This will typically need to just be the walking sprite
fallback_sprite = sSnowball;

melee_distance = 20;
damage = 5;

canAttackFromRange = false;

/* 
	Do not change anything after this!
*/
