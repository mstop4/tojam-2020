#macro MIN_CHILDREN 2
#macro MAX_CHILDREN 4
#macro MAX_DEPTH 4
#macro HINT_RATIO 0.25

#macro MIN_HINT_TIME 300
#macro MAX_HINT_TIME 900

randomize();
init_enums();

node_list = ds_list_create();
tree = build_level();

cur_address = "";
cur_address_display = "";
solution_address = build_solution(tree);

// Hints
hint_guy = instance_create_layer(480, 32, "Instances", obj_hint);

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