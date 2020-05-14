if (parent_door_target) {
	with (obj_level.parent_door) event_user(0);
}

x = ds_stack_pop(obj_level.door_x_stack);
obj_player.state = PLAYER_STATE.STAND;
// down_prompt.x = -100;