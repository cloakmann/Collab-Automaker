switch(currentState){
    case 'AddSprites':
        ds_list_add(global.logList,"<Processing Phase 3>");
        scrAddSprites2();
        currentState = 'AddBackground';
        break;
    case 'AddBackground':
        scrAddBackground2();
        currentState = 'AddRooms';
        break;
    case 'AddRooms':
        scrAddRooms2()
        currentState = 'AddSounds';
        break;
    case 'AddSounds':
        scrAddSounds2()
        currentState = 'AddScripts';
        break;
    case 'AddScripts':
        scrAddScripts()
        currentState = 'EditObjectGmx';
        break;
    case 'EditObjectGmx':
        scrFinalize();
        currentState = 'finish';
        break;
    
    
    default:
        phase = 4;
        ds_list_add(global.logList,"<Finish Processing Phase 3>");
        break;
}
