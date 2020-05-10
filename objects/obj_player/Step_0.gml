if (!input_locked) {
	var _h_input = keyboard_check(vk_right) - keyboard_check(vk_left);
	
	if (_h_input != 0) {
		facing = _h_input > 0 ? FACING.RIGHT : FACING.LEFT;
		state = PLAYER_STATE.WALK;
		x = clamp(x + _h_input * walk_speed, 16, room_width-16);
	} else {
		state = PLAYER_STATE.STAND;
	}
}


if (obj_tree.parent_door.active) {
	parent_door_target = abs(x - obj_tree.parent_door.x) < 32;
} else {
	parent_door_target = false;
}

if (obj_tree.hint_guy.active) {
	hint_target = abs(x - obj_tree.hint_guy.x) < 32;
} else {
	hint_target = false;
}

var _len = array_length_1d(obj_tree.door_pool)
door_target = noone;

for (var i=0; i<_len; i++) {
	if (obj_tree.door_pool[i].active && abs(x - obj_tree.door_pool[i].x < 32)) {
		door_target = obj_tree.door_pool[i];
		break;
	}
}