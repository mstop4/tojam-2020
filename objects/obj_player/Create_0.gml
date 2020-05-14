hint_target = false;
parent_door_target = false;
door_target = noone;

input_locked = false;
facing = FACING.RIGHT;
state = PLAYER_STATE.STAND;

y = 128;

// Prompts
// up_prompt = instance_create_layer(-100, 32, "Prompts", obj_prompt);
// down_prompt = instance_create_layer(-100, 128, "Prompts", obj_prompt);
// down_prompt.image_index = 1;

sprite_list[PLAYER_STATE.STAND, FACING.LEFT] = spr_player_stand_l;
sprite_list[PLAYER_STATE.STAND, FACING.RIGHT] = spr_player_stand_r;
sprite_list[PLAYER_STATE.WALK, FACING.LEFT] = spr_player_walk_l;
sprite_list[PLAYER_STATE.WALK, FACING.RIGHT] = spr_player_walk_r;
sprite_list[PLAYER_STATE.ENTER, FACING.LEFT] = spr_player_enter_l;
sprite_list[PLAYER_STATE.ENTER, FACING.RIGHT] = spr_player_enter_r;
sprite_list[PLAYER_STATE.WIN, FACING.LEFT] = spr_player_win;
sprite_list[PLAYER_STATE.WIN, FACING.RIGHT] = spr_player_win;