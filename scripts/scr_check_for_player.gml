///scr_check_for_player

if (instance_exists(obj_player)){
    var dir = point_direction(x,y, obj_player.x, obj_player.y);
    var dis = point_distance(x,y, obj_player.x, obj_player.y);
    if (dis < sight){
        state = scr_enemy_chase_state;
        target_x = obj_player.x;
        target_y = obj_player.y;
        with(obj_monstor_2){
            var x_dir = lengthdir_x(1, global.dir);
            var y_dir = lengthdir_y(1, global.dir);
            if(alarm[2] <= 0){
                var fireball = instance_create(obj_monstor_2.x + x_dir,obj_monstor_2.y + y_dir, obj_fireball);
                alarm[2] = room_speed*irandom_range(4,6);
            }
            
            //fireball.phy_position_x += (sign(dir)+4);
        }
    }else{
        scr_enemy_chose_next_state();
    }
}else{
   scr_enemy_chose_next_state(); 
}