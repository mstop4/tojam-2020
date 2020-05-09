//@arg room_map
//@arg to_parent
var _room_map = argument[0];
var _to_parent = argument[1];

if (!ds_exists(_room_map, ds_type_map)) return;

var _current_doors = get_door_values(_room_map);
var _len = array_length_1d(_current_doors);

// Check if this is a leaf node
if (_len == 0) {
	return open_leaf_node(_room_map[? "value"]);
}

instance_deactivate_object(obj_door);
if (_room_map[? "parent"] != -1) {
	instance_activate_object(parent_door);
	parent_door.room_index = _room_map[? "parent"];
}

for (var i=0; i<_len; i++) {
	instance_activate_object(door_pool[i]);
	door_pool[i].room_index = _current_doors[i];
	door_pool[i].value = door_pool[i].room_index[? "value"];
	door_pool[i].image_index = !ds_map_exists(door_pool[i].room_index, "children") ? 1 : 0;
}

if (_to_parent) {
	cur_address = string_delete(cur_address, string_length(cur_address), 1);
} else {
	cur_address += string(_room_map[? "value"]);
}