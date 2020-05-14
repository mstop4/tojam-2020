if (status == HINT_STATUS.TRANSITION) {
	dispatch_hint(room_index);
	status = HINT_STATUS.PENDING;
}

else if (status == HINT_STATUS.SHUTDOWN) {
	timeline_index = tmln_hint_idle;
	timeline_position = 0;
	timeline_running = true;
	status = HINT_STATUS.GIVEN;
}