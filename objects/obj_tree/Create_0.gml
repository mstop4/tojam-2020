#macro MIN_CHILDREN 2
#macro MAX_CHILDREN 4
#macro MAX_DEPTH 3
#macro MAX_NODES 1024

// Create tree and root node
tree = ds_map_create();
build_level(tree, false);

address = "";
door_pool = [];

for (var i=0; i<MAX_CHILDREN; i++) {
	door_pool[i] = instance_create_layer(32 + i*96, 32, "Instances", obj_door);
}

parent_door = instance_create_layer(64, 128, "Instances", obj_door);
parent_door.value = 0;
parent_door.is_parent_door = true;

switch_room(tree, false);