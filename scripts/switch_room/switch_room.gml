//@arg room_map
//@arg door_state
var _room_map = argument[0];
var _door_state = argument[1];

if (!ds_exists(_room_map, ds_type_map)) return;

var _current_doors = get_door_values(_room_map);
var _len = array_length_1d(_current_doors);

// Check if this is a leaf node
if (_len == 0) return;

// Set up doors
with (obj_door) {
	active = false;
	image_index = 0;
	image_speed = 0;
}
instance_deactivate_object(obj_door);

if (_room_map[? "parent"] != -1) {
	parent_door.active = true;
	instance_activate_object(parent_door);
	parent_door.room_index = _room_map[? "parent"];
	layer_set_visible(prompt_layer, false);
} else {
	layer_set_visible(prompt_layer, true);
}

var _x_pos = get_door_spacing(_len, 32, 16);

for (var i=0; i<_len; i++) {
	instance_activate_object(door_pool[i]);
	door_pool[i].x = _x_pos[i];
	door_pool[i].active = true;
	door_pool[i].room_index = _current_doors[i];
	door_pool[i].value = door_pool[i].room_index[? "value"];
	door_pool[i].state = !ds_map_exists(door_pool[i].room_index, "children") ? DOOR_TYPE.MAILBOX : DOOR_TYPE.DOOR;
}

if (_door_state == DOOR_TYPE.PARENT_DOOR) {
	cur_address = string_delete(cur_address, string_length(cur_address), 1);
} else {
	cur_address += string(_room_map[? "value"]);
}

// Set up hints
if (_room_map[? "hasHint"]) {
	instance_activate_object(hint_guy);
	hint_guy.active = true;
	hint_guy.room_index = _room_map;
	hint_guy.status = _room_map[? "hintStatus"];
	
	switch (hint_guy.status) {
		case HINT_STATUS.NOT_GIVEN:
			hint_guy.timeline_index = tmln_hint_idle;
			hint_guy.timeline_position = 0;
			hint_guy.timeline_running = true;
			break;
		case HINT_STATUS.PENDING:
			hint_guy.image_index = 0;
			hint_guy.timeline_running = false;
			break;
		case HINT_STATUS.GIVEN:
			hint_guy.timeline_index = tmln_hint_idle;
			hint_guy.timeline_position = 0;
			hint_guy.timeline_running = true;
			break;
	}

} else {
	hint_guy.active = false;
	instance_deactivate_object(hint_guy);
}