if (!input_locked && parent_door_target) {
	input_locked = true;
	state = PLAYER_STATE.STAND;
	obj_tree.parent_door.image_speed = 1;
	
	obj_gui.switch_mode = 1;
	obj_gui.transition_state = TRANSITION_STATE.IN;
}