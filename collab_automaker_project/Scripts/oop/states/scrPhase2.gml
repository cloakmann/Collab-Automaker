switch(currentState){
    case 'LoadSkins':
        ds_list_add(global.logList,"<Processing Phase 2>");
        global.skinsMap = ds_map_create();
        global.bgMap = ds_map_create();
        scrLoadSkins();
        currentState = 'LoadJmap';
        break;
    case 'LoadJmap':
        global.jmapMap = ds_map_create();
        global.bigmapMap = ds_map_create();
        scrLoadJmap();
        currentState = 'LoadSound';
        break;
    case 'LoadSound':
        global.soundMap = ds_map_create();
        scrLoadSound();
        currentState = 'default';
        break;
    default:
        currentState = 'AddSprites';
        ds_list_add(global.logList,"<Finish Processing Phase 2>");
        phase = 3;
        break;
}
