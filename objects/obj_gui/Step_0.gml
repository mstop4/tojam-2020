if (transition_state == TRANSITION_STATE.IN && fade_alpha < 1) {
	fade_alpha = min(fade_alpha + fade_speed, 1);
	if (fade_alpha == 1) {
		transition_state = TRANSITION_STATE.OUT;
		with (obj_player) event_user(other.switch_mode);
	}
}

else if (transition_state == TRANSITION_STATE.OUT && fade_alpha > 0) {
	fade_alpha = max(fade_alpha - fade_speed, 0);
	if (fade_alpha == 0) {
		transition_state = TRANSITION_STATE.IDLE;
		obj_player.input_locked = false;
	}
}