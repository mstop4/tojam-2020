var _win = open_leaf_node(door_target.room_index[? "value"]);

if (!_win) {
	door_target.image_speed = 1;
	var _letter = instance_create_layer(x, y-47, "Player", obj_letter_send);
	_letter.direction = 270;
	alarm[1] = 30;
} else {
	state = PLAYER_STATE.WIN;
}