var _len = ds_list_size(hint_timers);
var i = 0;

while (i < _len) {
	hint_timers[| i]--;
	
	if (hint_timers[| i] == 0) {
		give_hint(hint_rooms[| i], hints[| i]);
		
		ds_list_delete(hint_timers, i);
		ds_list_delete(hints, i);
		ds_list_delete(hint_rooms, i);
		_len = ds_list_size(hint_timers);
	} else {
		i++;
	}
}