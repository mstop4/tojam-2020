status = HINT_STATUS.NOT_GIVEN;
display = "?";
room_index = -1;

sprite_list[HINT_STATUS.NOT_GIVEN] = spr_hint_not_given;
sprite_list[HINT_STATUS.TRANSITION] = spr_hint_transition;
sprite_list[HINT_STATUS.PENDING] = spr_hint_pending;
sprite_list[HINT_STATUS.SHUTDOWN] = spr_hint_shutdown;
sprite_list[HINT_STATUS.GIVEN] = spr_hint_given;

timeline_loop = true;