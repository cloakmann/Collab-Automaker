//set first room
//if has at least 1 stage
var firstRoom;
firstRoom = '';

var i;
if (ds_map_size(global.jmapMap) > 0){
    var curFolderKey,curFolder;
    for(curFolderKey = ds_map_find_first(global.jmapMap);
        ds_map_exists(global.jmapMap,curFolderKey);
        curFolderKey = ds_map_find_next(global.jmapMap,curFolderKey)){
        
        curFolder = ds_map_find_value(global.jmapMap,curFolderKey);
        
        if (firstRoom == '' and ds_map_size(curFolder) > 0){
            firstRoom = ds_map_find_first(curFolder);
        }
        else continue;
    }
}
else exit;

//change scrSetGlobalOptions

var f;
f = file_text_open_write(global.scriptDir + '\scrSetGlobalOptions.gml');

var tempList;
tempList = ds_map_find_value(global.scriptMap,'scrSetGlobalOptions');



var tempString,caption;
tempString = '';
caption = false;
for (i = 0; i < ds_list_size(tempList); i += 1){
    tempString = ds_list_find_value(tempList,i);
    
    if (string_pos('global.roomCaptionDef',tempString) != 0 and !caption) {
        writeWithBreak(f,'global.roomCaptionDef = "' + string(global.projName) + '";  //sets default window caption (only works with the Professional version of Studio)');
        caption = true;
    }
    else if (string_pos('global.startRoom',tempString) != 0) writeWithBreak(f,'global.startRoom = ' + string(firstRoom) + ';    //sets which room to begin with');
    else if (string_pos('global.stageEndEffect',tempString) != 0) writeWithBreak(f,'global.stageEndEffect = ' + string(global.stageEndEffect) + ';    //enable room transition effect after finishing each stage');
    else if (string_pos('global.stageEndKind',tempString) != 0) writeWithBreak(f,'global.stageEndKind = ' + string(global.stageEndKind) + ';    //index of stage transition effect');
    else if (string_pos('global.roomEndEffect',tempString) != 0) writeWithBreak(f,'global.roomEndEffect = ' + string(global.roomEndEffect) + ';    // enable room transition effect after finishing each room');
    else if (string_pos('global.roomEndKind',tempString) != 0) writeWithBreak(f,'global.roomEndKind = ' + string(global.roomEndKind) + ';    //index of room transition effect');
    else if (string_pos('global.gameClearEffect',tempString) != 0) writeWithBreak(f,'global.gameClearEffect = ' + string(global.gameClearEffect) + ';    // enable room transition effect after game clear');
    else if (string_pos('global.gameClearKind',tempString) != 0) writeWithBreak(f,'global.gameClearKind = ' + string(global.gameClearKind) + ';    //index of game clear transition effect');
    else writeWithBreak(f,tempString);
}
//show_message(tempString);

file_text_close(f);
