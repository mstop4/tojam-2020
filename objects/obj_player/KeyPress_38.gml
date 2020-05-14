if (!input_locked) {
	if (hint_target) {
		with (obj_level.hint_guy) event_user(0);
	}

	else if (door_target != noone) {
		input_locked = true;
		state = PLAYER_STATE.ENTER;

		var _current_doors = get_door_values(door_target.room_index);
		var _len = array_length_1d(_current_doors);

		// Check if this is a leaf node
		if (_len > 0) {
			door_target.image_index = 0;
			door_target.image_speed = 1;
			obj_gui.switch_mode = 0;
			obj_gui.transition_state = TRANSITION_STATE.IN;
			ds_stack_push(obj_level.door_x_stack, door_target.x);
		} else {
			var _letter = instance_create_layer(x, y-32, "Player", obj_letter_send);
			_letter.door_target = door_target;
			alarm[0] = 60;
		}
	}
}