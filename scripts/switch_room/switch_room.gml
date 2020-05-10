//@arg room_map
//@arg to_parent
var _room_map = argument[0];
var _to_parent = argument[1];

if (!ds_exists(_room_map, ds_type_map)) return;

var _current_doors = get_door_values(_room_map);
var _len = array_length_1d(_current_doors);

// Check if this is a leaf node
if (_len == 0) return;

// Set up doors
with (obj_door) active = false;
instance_deactivate_object(obj_door);

if (_room_map[? "parent"] != -1) {
	parent_door.active = true;
	instance_activate_object(parent_door);
	parent_door.room_index = _room_map[? "parent"];
}

var _x_pos = get_door_spacing(_len, 32, 16);

for (var i=0; i<_len; i++) {
	instance_activate_object(door_pool[i]);
	door_pool[i].x = _x_pos[i];
	door_pool[i].active = true;
	door_pool[i].room_index = _current_doors[i];
	door_pool[i].value = door_pool[i].room_index[? "value"];
	door_pool[i].image_index = !ds_map_exists(door_pool[i].room_index, "children") ? 1 : 0;
}

if (_to_parent) {
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
			hint_guy.display = "?";
			hint_guy.image_index = 0;
			break;
		case HINT_STATUS.PENDING:
			hint_guy.display = "!";
			hint_guy.image_index = 1;
			break;
		case HINT_STATUS.GIVEN:
			hint_guy.display = _room_map[? "theHint"];
			hint_guy.image_index = 1;
			break;
	}

} else {
	hint_guy.active = false;
	instance_deactivate_object(hint_guy);
}