if(distance_to_object(oPlayer) < hit_distance) {
	damage_object(oPlayer, damage);
}

if(place_meeting(x,y,global.collision_objects)) {
	instance_destroy();	
}
if (oPlayer.x > oEnemy.x){
	image_xscale = -2;	
}
else{
	image_xscale = 2;	
}