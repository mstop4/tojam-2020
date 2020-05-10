#macro MIN_CHILDREN 2
#macro MAX_CHILDREN 3
#macro MAX_DEPTH 3
#macro HINT_RATIO 0.25

node_list = ds_list_create();
tree = build_level();

cur_address = "";
solution_address = build_solution(tree);

// Hints
hint_guy = instance_create_layer(256, 128, "Instances", obj_hint);

add_hints(node_list, solution_address);

// Doors
door_pool = [];

for (var i=0; i<MAX_CHILDREN; i++) {
	door_pool[i] = instance_create_layer(32 + i*96, 32, "Instances", obj_door);
}

parent_door = instance_create_layer(64, 128, "Instances", obj_door);
parent_door.value = 0;
parent_door.is_parent_door = true;



ds_list_destroy(node_list);

switch_room(tree, false);