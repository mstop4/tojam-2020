if (parent_door_target) {
	with (obj_tree.parent_door) event_user(0);
}

x = room_width / 2;
obj_player.state = PLAYER_STATE.STAND;