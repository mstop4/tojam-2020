if (status == HINT_STATUS.TRANSITION) {
	dispatch_hint(room_index);
	status = HINT_STATUS.PENDING;
}