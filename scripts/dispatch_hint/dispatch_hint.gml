//@arg room_index
var _room_map = argument[0];

if (!ds_exists(_room_map, ds_type_map)) return;
if (!_room_map[? "hasHint"]) return;

_room_map[? "hintStatus"] = HINT_STATUS.PENDING;

with (obj_hint_dispatch) {
	ds_list_add(hints, obj_level.hint_index);
	ds_list_add(hint_rooms, _room_map);
	ds_list_add(hint_timers, irandom_range(MIN_HINT_TIME, MAX_HINT_TIME));
}

with (obj_level) {
	hint_index++;

	if (hint_index >= ds_list_size(hint_list)) {
		hint_index = 0;
	}
	
	// Update hint guy if it is in the same room as the revealed hint
	if (hint_guy.room_index == _room_map) {
			hint_guy.status = HINT_STATUS.PENDING;
			hint_guy.display = "!";
			hint_guy.image_index = 1;
	}
}