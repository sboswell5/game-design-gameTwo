global.left_key = ord("A");
global.right_key = ord("D");
global.jump_key = vk_space;
global.interact_key = ord("F");

global.collision_objects = [oWall, oIce, oIceWall];
global.deceleration_objects = [oIce];

global.debug = false;
paused = false;
paused_surf = -1;

if(room != rm_paused) lastroom = room;