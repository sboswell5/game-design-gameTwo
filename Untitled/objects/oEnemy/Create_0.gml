oMaxHealth = 10;
oHealth = oMaxHealth;

isHurt = false;
invincibilityTimeMax = 20;
invincibilityTimer = 0;
flashForFrames = 10;

damage = 5;

grv=0.5;
vspd=0;

state = choose("left", "right");

_hurtBox = instance_create_layer(x,y, "Instances", oHurtBox);
_hurtBox.owner = self;
_hurtBox.width = sprite_width;
_hurtBox.height = sprite_height;
_hurtBox.x_offset = _hurtBox.width / 2 * -1;
_hurtBox.y_offset = _hurtBox.height / 2 * -1;