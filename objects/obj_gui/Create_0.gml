transition_state = TRANSITION_STATE.IDLE;
fade_alpha = 0;
switch_mode = 0;
show_win_message = false;

var _symbol_width = sprite_get_width(spr_symbols);
address_x = room_width-(MAX_DEPTH * (_symbol_width+2)) - _symbol_width + sprite_get_xoffset(spr_symbols);