//@arg room_map
var _room_map = argument[0];

if (!ds_exists(_room_map, ds_type_map)) return;

current_room = _room_map;
current_doors = get_door_values(current_room);
var _len = array_length_1d(current_doors);

instance_deactivate_object(obj_door);

for (var i=0; i<_len; i++) {
	instance_activate_object(door_pool[i]);
	door_pool[i].room_index = current_doors[i];
	door_pool[i].value = door_pool[i].room_index[? "value"];
}