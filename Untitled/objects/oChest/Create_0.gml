has_been_interacted = false;
interact_message = "";
x_center = x;
y_center = y - sprite_height / 2;
y_message_offset = -35;
x_message_offset = 0;
interact_radius = 80;

isInteractable = false;
interact_give_item = "NULL";
interact_give_item_amount = 1;
isKeyChest = false;

state = cState.UNOPENED;



enum cState {
	UNOPENED,
	WAITING,
	OPENED,
	LOCKED
}