//edit scrGetMusic

var i,firstRoom;
firstRoom = '';
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

var tempList;
tempList = ds_map_find_value(global.scriptMap,'scrGetMusic');


var startPos,tempString;
//position to start insert stage code
startPos = -1;
tempString = '';
for (i = 0; i < ds_list_size(tempList); i += 1){
    tempString = ds_list_find_value(tempList,i);
    if(string_pos('default',tempString) != 0) startPos = i;
}
//show_message('startPos: ' + string(startPos));


if(startPos == -1 or ds_map_size(global.jmapMap) == 0)exit;
else if (startPos != -1){
    var lineTotal,folderKey,folder,map,stageMapCount;
    lineTotal = 0;
    for(folderKey = ds_map_find_first(global.jmapMap);
        ds_map_exists(global.jmapMap,folderKey);
        folderKey = ds_map_find_next(global.jmapMap,folderKey)){
        
            folder = ds_map_find_value(global.jmapMap,folderKey);
            
            stageMapCount = 0;
            for(map = ds_map_find_first(folder);
                ds_map_exists(folder,map);
                map = ds_map_find_next(folder,map)){
                ds_list_insert(tempList,startPos + lineTotal,'    case ' + map + ":");
                lineTotal += 1;
                stageMapCount += 1;
            }
            
            if (stageMapCount > 0){
                ds_list_insert(tempList,startPos + lineTotal,'        roomSong = mus' + string_upper(folderKey) + ";");
                lineTotal += 1;
                ds_list_insert(tempList,startPos + lineTotal,'        break;');
                lineTotal += 1;
            }
            
    }

}



var f;
f= file_text_open_write(global.scriptDir + '\scrGetMusic.gml');



for(i = 0; i < ds_list_size(tempList); i += 1){
    writeWithBreak(f,ds_list_find_value(tempList,i));
}

file_text_close(f);
