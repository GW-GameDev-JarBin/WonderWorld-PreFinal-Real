///scr_check_for_player

if (instance_exists(obj_player)){
    var dir = point_direction(x,y, obj_player.x, obj_player.y);
    var dis = point_distance(x,y, obj_player.x, obj_player.y);
    if (dis <= sight){
        if(instance_exists(obj_boss)){
            
            with(obj_boss){
                state = scr_enemy_idel_state;
                var x_dir = lengthdir_x(1, global.dir);
                var y_dir = lengthdir_y(1, global.dir);
                if(sight >= dis){
                    if(alarm[2] <= 0){
                        var fireball = instance_create(obj_boss.x + x_dir,obj_boss.y + y_dir, obj_fireball);
                        alarm[2] = room_speed/2*irandom_range(1,3);
                    }
                }
            }
        }
            //fireball.phy_position_x += (sign(dir)+4);
        //}else{
            state = scr_enemy_chase_state;
        //}
        target_x = obj_player.x;
        target_y = obj_player.y;
    }else{
        state = scr_enemy_idel_state;
    }
}else{
   scr_enemy_chose_next_state(); 
}
