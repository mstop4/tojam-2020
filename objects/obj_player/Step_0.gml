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

if (obj_level.parent_door.active) {
	parent_door_target = abs(x - obj_level.parent_door.x) < 32;
	// down_prompt.x = parent_door_target ? obj_level.parent_door.x : -100;
} else {
	parent_door_target = false;
}

if (obj_level.hint_guy.active) {
	hint_target = abs(x - obj_level.hint_guy.x) < 32;
	// up_prompt.x = hint_target ? obj_level.hint_guy.x : -100;
} else {
	hint_target = false;
}

var _len = array_length_1d(obj_level.door_pool)
door_target = noone;

for (var i=0; i<_len; i++) {
	if (obj_level.door_pool[i].active && abs(x - obj_level.door_pool[i].x) < 32) {
		door_target = obj_level.door_pool[i];
		break;
	}
}

// up_prompt.x = door_target != noone ? door_target.x : -100;