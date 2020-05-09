#macro MIN_CHILDREN 2
#macro MAX_CHILDREN 4
#macro MAX_DEPTH 3
#macro MAX_NODES 1024

// Create tree and root node
tree = ds_map_create();
build_level(tree);

current_room = tree;
current_doors = get_door_values(current_room);
var _len = array_length_1d(current_doors);

for (var i=0; i<_len; i++) {
	var _door = instance_create_layer(32 + i*96, 32, "Instances", obj_door);
	_door.value = current_doors[i];
}