if (!input_locked) {
	if (hint_target) {
		with (obj_tree.hint_guy) event_user(0);
	}

	else if (door_target != noone) {
		input_locked = true;
		state = PLAYER_STATE.ENTER;
		
		var _current_doors = get_door_values(door_target.room_index);
		var _len = array_length_1d(_current_doors);

		// Check if this is a leaf node
		if (_len > 0) {
			obj_gui.switch_mode = 0;
			obj_gui.transition_state = TRANSITION_STATE.IN;
		} else {
			instance_create_layer(x, y-32, "Player", obj_letter_send);
			alarm[0] = 60;
		}
	}
}