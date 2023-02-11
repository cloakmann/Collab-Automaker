
var objectList;
objectList = ds_list_create();

//all the objects that need to be loaded from template project
ds_list_insert(objectList,ds_list_size(objectList),'objBlock.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objCherry.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objGravityDown.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objGravityUp.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objJumpRefresher.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objKillerBlock.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objMiniKillerBlock.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objMiniBlock.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objMiniDown.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objMiniLeft.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objMiniRight.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objMiniUp.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objMovingPlatform.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objPlatform.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objPlayerStart.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objSave.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objSaveBlocker.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objSaveFlip.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objSpikeDown.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objSpikeLeft.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objSpikeRight.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objSpikeUp.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objWalljumpL.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objWalljumpR.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objWarpAutosaveNext.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objWarpNext.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objWater.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objWater2.object.gmx');
ds_list_insert(objectList,ds_list_size(objectList),'objWater3.object.gmx');


/*
//test program to check if objectList is correctly loaded
var tempString;
tempString = 'sprite gmx list: #';
for(i = 0; i < ds_list_size(objectList); i += 1){
    tempString += ds_list_find_value(objectList,i) + "#";
}

show_message(tempString);
*/

var objectPrefix;
//objectPrefix = 'template/objects/';
objectPrefix = global.templateDir + '\objects\';

//gmxName = gmx file name that is currently loading
//tempFile = gmx file that is loading
//tempList = tempFile in ds_list
//tempString = current line of tempFile to be stored in tempList

var gmxName,tempFile,tempList,tempString;
//get all the gmx accordiing to objectList into global.objMap
for(i = 0; i < ds_list_size(objectList); i += 1){
    //get the name of file
    gmxName = ds_list_find_value(objectList,i);
    //show_message(objectPrefix + gmxName);
    
    tempFile = file_text_open_read(objectPrefix + gmxName);
    //ds_map_add(global.objMap,objectPrefix + gmxName,'');
    
    //copy the gmx file's data line by line into tempList
    tempList = ds_list_create();
    while(!file_text_eof(tempFile)){
        tempString = file_text_read_string(tempFile);
        ds_list_add(tempList,tempString);
        file_text_readln(tempFile);
    }
    file_text_close(tempFile);
    
    //add tempList to global.objMap
    //ds_map_add(global.objMap,objectPrefix + gmxName,tempList);
    //ds_map_add(global.objMap,gmxName,tempList);
    var p,tempName;
    p = string_pos(".",gmxName);
    tempName = string_copy(gmxName,1,p - 1);
    
    ds_map_add(global.spriteMap,tempName,tempList);
}

var tempLog;

tempLog = "total " + string(ds_list_size(global.objMap)) + " objects loaded";
ds_list_add(global.logList,tempLog);

/*
//test program to check if the object gmx are correctly loaded

var currentKey,currentList;
//show the gmx content
for(i = 0; i < ds_map_size(global.objMap); i += 1){
    tempString = "global.objMap[" + string(i) + "]: ";
    tempString += ds_list_find_value(objectList,i) + "#";
    
    //get the i - th key in global.objMap
    currentKey = ds_map_find_first(global.objMap);
    if (i != 0) {
        repeat(i){
            currentKey = ds_map_find_next(global.objMap,currentKey);
        }
    }
    
    currentList = ds_map_find_value(global.objMap,currentKey);
    //get the corr. list content and show data
    for (j = 0; j < ds_list_size(currentList); j += 1){
        tempString += ds_list_find_value(currentList,j) + "#";
    }
    show_message(tempString);
}

