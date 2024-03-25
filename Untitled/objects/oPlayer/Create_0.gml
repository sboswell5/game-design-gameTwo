maxhspd = 5;
maxvspd = 5;

hspd = 0;
vspd = 0;
grv = 0.5;

vspdJump = -10.5;
can_jump = 0;

default_deceleration = 0.5;
current_deceleration = default_deceleration;

walking_on_collisions = ds_list_create();

typing = false;

holding = undefined;

state = PlayerState.IDLE;

//sprite_index = getPlayerSprite(state, holding); DOTO: Remove comment once we have player sprites
sprite_test = getPlayerSprite(state, holding);