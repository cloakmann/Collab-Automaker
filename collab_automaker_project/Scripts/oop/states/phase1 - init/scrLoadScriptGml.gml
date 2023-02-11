var scriptList;
scriptList = ds_list_create();

//gml that needs to be loaded
ds_list_insert(scriptList,ds_list_size(scriptList),'scrCheckRoom.gml');
ds_list_insert(scriptList,ds_list_size(scriptList),'scrAutoBlockSprites.gml');
ds_list_insert(scriptList,ds_list_size(scriptList),'scrAutoKillerSprites.gml');
ds_list_insert(scriptList,ds_list_size(scriptList),'scrAutoMiscSprites.gml');

ds_list_insert(scriptList,ds_list_size(scriptList),'scrGetMusic.gml');
ds_list_insert(scriptList,ds_list_size(scriptList),'scrSetGlobalOptions.gml');



/*
//test program to check if scriptList is correctly loaded
var tempString;
tempString = 'sprite gmx list: #';
for(i = 0; i < ds_list_size(scriptList); i += 1){
    tempString += ds_list_find_value(scriptList,i) + "#";
}

show_message(tempString);
*/

var sprPrefix;
//sprPrefix = 'template\scripts\';
sprPrefix = global.templateDir + '\scripts\';


//gmxName = gmx file name that is currently loading
//tempFile = gmx file that is loading
//tempList = tempFile in ds_list
//tempString = current line of tempFile to be stored in tempList

//get all the gmx accordiing to scriptList into global.scriptMap
for(i = 0; i < ds_list_size(scriptList); i += 1){
    //get the name of file
    gmxName = ds_list_find_value(scriptList,i);
    //show_message(sprPrefix + gmxName);
    tabLog();
    addLog("adding script: " + gmxName); 
    resetLog();
    
    tempFile = file_text_open_read(sprPrefix + gmxName);
    //ds_map_add(global.scriptMap,sprPrefix + gmxName,'');
    
    //copy the gmx file's data line by line into tempList
    tempList = ds_list_create();
    while(!file_text_eof(tempFile)){
        tempString = file_text_read_string(tempFile);
        ds_list_add(tempList,tempString);
        file_text_readln(tempFile);
    }
    file_text_close(tempFile);
    
    //add tempList to global.scriptMap
    //ds_map_add(global.scriptMap,sprPrefix + gmxName,tempList);
    //ds_map_add(global.scriptMap,gmxName,tempList);
    
    var p,tempName;
    p = string_pos(".",gmxName);
    tempName = string_copy(gmxName,1,p - 1);
    
    ds_map_add(global.scriptMap,tempName,tempList);
}

var tempLog;

tempLog = "total " + string(ds_list_size(scriptList)) + " scripts loaded";
ds_list_add(global.logList,tempLog);

ds_list_destroy(scriptList);



/*
//test program to check if the script gmx are correctly loaded

var currentKey,currentList;
//show the gmx content
for(i = 0; i < ds_map_size(global.scriptMap); i += 1){
    tempString = "global.scriptMap[" + string(i) + "]: ";
    tempString += ds_list_find_value(scriptList,i) + "#";
    
    //get the i - th key in global.scriptMap
    currentKey = ds_map_find_first(global.scriptMap);
    if (i != 0) {
        repeat(i){
            currentKey = ds_map_find_next(global.scriptMap,currentKey);
        }
    }
    
    currentList = ds_map_find_value(global.scriptMap,currentKey);
    //get the corr. list content and show data
    for (j = 0; j < ds_list_size(currentList); j += 1){
        tempString += ds_list_find_value(currentList,j) + "#";
    }
    show_message(tempString);
}

