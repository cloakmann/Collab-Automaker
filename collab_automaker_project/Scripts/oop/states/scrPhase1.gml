switch(currentState){
    case 'InitOutputProj':
        ds_list_add(global.logList,"<Processing Phase 1>");
        scrInitOutputProj();
        currentState = 'LoadStageList';
        break;
    case 'LoadStageList':
        global.stageList = ds_list_create();
        scrLoadStageList();
        currentState = 'LoadSpriteGmx';
        break;
    case 'LoadSpriteGmx':
        global.spriteMap = ds_map_create();
        scrLoadSpriteGmx();
        currentState = 'LoadScriptGml';
        break;
    case 'LoadScriptGml':
        global.scriptMap = ds_map_create();
        scrLoadScriptGml();
        currentState = 'LoadSoundGmx';
        break;
    case 'LoadSoundGmx':
        global.soundList = ds_list_create();
        scrLoadSoundGmx();
        currentState = 'LoadBgGmx';
        break;
    case 'LoadBgGmx':
        //global.bgList = ds_map_create();
        global.bgList = ds_list_create();
        scrLoadBgGmx();
        currentState = 'LoadObjGmx';
        break;
    case 'LoadObjGmx':
        global.objMap = ds_map_create();
        scrLoadObjGmx();
        currentState = 'LoadRoomGmx';
        break;
    case 'LoadRoomGmx':
        global.roomList = ds_list_create();
        scrLoadRoomGmx();
        currentState = 'LoadProj';
        break;
    case 'LoadProj':
        global.projList = ds_list_create();
        scrLoadProj();
        //currentState = 'LoadJmap';
        //currentState = 'LoadSkins'
        currentState = 'LoadConfig';
        break;
    case 'LoadConfig':
        global.configMap = ds_map_create();
        scrLoadConfig();
        currentState = 'LoadSkins';
        ds_list_add(global.logList,"<Finish Processing Phase 1>");
        break;
    default:
        //ds_list_add(global.logList,"<Finish Processing Phase 1>");
        phase = 2;
        break;
}
