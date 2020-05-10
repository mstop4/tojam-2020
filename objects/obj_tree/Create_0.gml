#macro MIN_CHILDREN 2
#macro MAX_CHILDREN 4
#macro MAX_DEPTH 4
#macro HINT_RATIO 0.25

#macro MIN_HINT_TIME 300
#macro MAX_HINT_TIME 900

randomize();
init_enums();
display_set_gui_maximise(4,4);

node_list = ds_list_create();
tree = build_level();

cur_address = "";
solution_address = build_solution(tree);
show_solution = false;

// Hints
hint_guy = instance_create_layer(288, 120, "Hint", obj_hint);

add_hints(node_list, solution_address);

// Doors
door_pool = [];

for (var i=0; i<MAX_CHILDREN; i++) {
	door_pool[i] = instance_create_layer(16 + i*48, 112, "Doors", obj_door);
}

parent_door = instance_create_layer(room_width/2, 216, "Parent", obj_door);
parent_door.sprite_index = spr_parent_door;
parent_door.image_alpha = 0.25;
parent_door.value = 0;
parent_door.is_parent_door = true;

ds_list_destroy(node_list);

switch_room(tree, false);