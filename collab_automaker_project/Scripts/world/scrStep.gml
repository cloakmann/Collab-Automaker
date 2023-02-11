//if the process is already finished
//if any key event other than mouse wheel-> game_end()
switch(phase){
    case 1:
        scrPhase1();
        break;
    case 2:
        scrPhase2();
        break;
    case 3:
        scrPhase3();
        break;
    default:
        if (!finished){
            ds_list_add(global.logList,'<Press L to Export Log>')
            ds_list_add(global.logList,'<Press Enter to Exit>')
            finished = true;
        }
        break;
}

if finished and !mouse_wheel_up() and !mouse_wheel_down() {
    if keyboard_check_pressed(ord('L')){
        //get the log file
        f = file_text_open_write('log.txt');
        for(i = 0; i < ds_list_size(global.logList); i += 1){
            file_text_write_string(f,ds_list_find_value(global.logList,i));
            file_text_writeln(f);
        }
        file_text_close(f);
        show_message ("log has been saved at: #" + working_directory);
    }
    if keyboard_check_pressed(vk_enter) game_end();
}


