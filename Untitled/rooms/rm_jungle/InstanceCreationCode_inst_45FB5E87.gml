rangedObject = -1; 
oMaxHealth = 10;

idle_sprite = sMudball;
walking_sprite = sMudball;
hunting_sprite = -1; // Typically the same as the walking sprite but can be changed
attacking_melee_sprite = -1;
attacking_ranged_sprite = -1;

// If a sprite is not defined, it will fall back to this one.
// This will typically need to just be the walking sprite
fallback_sprite = sMudball;

melee_distance = 20;
damage = 5;

canAttackFromRange = false;
