var _win = open_leaf_node(door_target.room_index[? "value"]);

if (!_win) {
	input_locked = false;
	state = PLAYER_STATE.STAND;
	var _letter = instance_create_layer(x, y-47, "Player", obj_letter_send);
	_letter.direction = 270;
} else {
	state = PLAYER_STATE.WIN;
}