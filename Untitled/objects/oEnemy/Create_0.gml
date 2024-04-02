/*
	Edit these variables in the "Creation Code" of the object in the room
*/
rangedObject = -1; 
oMaxHealth = 10;

idle_sprite = -1;
walking_sprite = -1;
hunting_sprite = -1; // Typically the same as the walking sprite but can be changed
attacking_melee_sprite = -1;
attacking_ranged_sprite = -1;

// If a sprite is not defined, it will fall back to this one.
// This will typically need to just be the walking sprite
fallback_sprite = sEnemy;

melee_distance = 5;
damage = 5;

canAttackFromRange = false;

/* 
	Do not change anything after this!
*/

oHealth = oMaxHealth;

isHurt = false;
invincibilityTimeMax = 20;
invincibilityTimer = 0;
flashForFrames = 10;

randomStateTimer = 0;
randomStateMaxTimer = 300;

grv=0.5;
vspd=0;


direct = choose("left", "right");
state = eState.WANDERING;
isRangedAttacking = false;
isMeleeAttacking = false;

if(sprite_exists(walking_sprite)) {
	sprite_index = walking_sprite;
} else {
	sprite_index = fallback_sprite;
}

isPlayerOnSamePlatform = false;

_hurtBox = instance_create_layer(x,y, "Instances", oHurtBox);
_hurtBox.owner = self;
_hurtBox.width = sprite_width;
_hurtBox.height = sprite_height;
_hurtBox.x_offset = _hurtBox.width / 2 * -1;
_hurtBox.y_offset = _hurtBox.height / 2 * -1;

enum eState {
	IDLE,
	ATTACKING_MELEE,
	ATTACKING_RANGED,
	HUNTING,
	WANDERING,
}