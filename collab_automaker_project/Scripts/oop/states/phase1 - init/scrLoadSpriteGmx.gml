
var spriteList;
spriteList = ds_list_create();

//all the sprites that need to be loaded from template project
ds_list_insert(spriteList,ds_list_size(spriteList),'sprBlockMask.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprCherry.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprGravityDown.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprGravityUp.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprJumpRefresher.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprKillerBlock.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprMiniKillerBlock.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprMiniBlockMask.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprMiniDown.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprMiniLeft.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprMiniRight.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprMiniUp.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprMovingPlatform.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprPlatform.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprPlayerStart.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprSave.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprSaveBlocker.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprSaveFlip.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprSaveMask.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprSpikeDown.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprSpikeLeft.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprSpikeRight.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprSpikeUp.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprWalljumpL.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprWalljumpR.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprWarp.sprite.gmx');
ds_list_insert(spriteList,ds_list_size(spriteList),'sprWater.sprite.gmx');

/*
//test program to check if spriteList is correctly loaded
var tempString;
tempString = 'sprite gmx list: #';
for(i = 0; i < ds_list_size(spriteList); i += 1){
    tempString += ds_list_find_value(spriteList,i) + "#";
}

show_message(tempString);
*/

var sprPrefix;
//sprPrefix = 'template/sprites/';
sprPrefix = global.templateDir + '\sprites\';


//gmxName = gmx file name that is currently loading
//tempFile = gmx file that is loading
//tempList = tempFile in ds_list
//tempString = current line of tempFile to be stored in tempList

var gmxName,tempFile,tempList,tempString;
//get all the gmx accordiing to spriteList into global.spriteMap
for(i = 0; i < ds_list_size(spriteList); i += 1){
    //get the name of file
    gmxName = ds_list_find_value(spriteList,i);
    //show_message(sprPrefix + gmxName);
    
    tempFile = file_text_open_read(sprPrefix + gmxName);
    //ds_map_add(global.spriteMap,sprPrefix + gmxName,'');
    
    //copy the gmx file's data line by line into tempList
    tempList = ds_list_create();
    while(!file_text_eof(tempFile)){
        tempString = file_text_read_string(tempFile);
        ds_list_add(tempList,tempString);
        file_text_readln(tempFile);
    }
    file_text_close(tempFile);
    
    //add tempList to global.spriteMap
    //ds_map_add(global.spriteMap,sprPrefix + gmxName,tempList);
    
    var p,tempName;
    p = string_pos(".",gmxName);
    tempName = string_copy(gmxName,1,p - 1);
    
    ds_map_add(global.spriteMap,tempName,tempList);
}

var tempLog;

tempLog = "total " + string(ds_list_size(spriteList)) + " sprite gmx loaded";
ds_list_add(global.logList,tempLog);
ds_list_destroy(spriteList);

/*
//test program to check if the sprite gmx are correctly loaded

var currentKey,currentList;
//show the gmx content
for(i = 0; i < ds_map_size(global.spriteMap); i += 1){
    tempString = "global.spriteMap[" + string(i) + "]: ";
    tempString += ds_list_find_value(spriteList,i) + "#";
    
    //get the i - th key in global.spriteMap
    currentKey = ds_map_find_first(global.spriteMap);
    if (i != 0) {
        repeat(i){
            currentKey = ds_map_find_next(global.spriteMap,currentKey);
        }
    }
    
    currentList = ds_map_find_value(global.spriteMap,currentKey);
    //get the corr. list content and show data
    for (j = 0; j < ds_list_size(currentList); j += 1){
        tempString += ds_list_find_value(currentList,j) + "#";
    }
    show_message(tempString);
}

