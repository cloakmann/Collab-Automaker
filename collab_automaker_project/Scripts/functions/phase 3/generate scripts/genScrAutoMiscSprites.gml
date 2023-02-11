//open the scrAutoKillerSprites script

var f;
f = file_text_open_write(global.scriptDir + '\scrAutoMiscSprites.gml');

/*
visible = true;
image_speed = 1/15;
switch(scrCheckRoom(room)){
    case 1: 
        sprite_index = sprS1Block;
        break;
    ...
    case n:
        sprite_index = sprS[n]Block;
        break;
    default: 
        image_speed = 0;
        visible = false;
        break;
}
*/

var tab,tabNum,tempString;
tab = "    ";
tabNum = 0;

writeWithBreak(f,"///scrAutoMiscSprites()");
writeWithBreak(f,"//generated by convertor, if you edit it by hand then you do so at your own risk!");
writeWithBreak(f,"visible = true;");
//writeWithBreak(f,"image_speed = 1/15;");

writeWithBreak(f,"switch(object_index){");

var objName;
//objName[0]='MovingPlatform';
objName[0]='Platform';
objName[1]='Save';
objName[2]='WalljumpL';
objName[3]='WalljumpR';
objName[4]='SaveBlocker';
objName[5]='WarpAutosaveNext';
objName[6]='JumpRefresher';
objName[7]='Water';
objName[8]='Water2';
objName[9]='Water3';
objName[10]='GravityUp';
objName[11]='GravityDown';
objName[12]='SaveFlip';


//writeWithBreak(f,tab + "case objBlock: break;")
var stageValueList,hasItem, i;

stageValueList = ds_list_create();
for(i = 0; i < ds_list_size(global.stageList); i += 1){
    ds_list_add(stageValueList,string_digits(ds_list_find_value(global.stageList,i)));
}

tabLog();
addLog("generating scrAutoMiscSprites for " + string(ds_list_size(stageValueList)) + " stages");

//0 - has sprS[i]Block?
//1 - has sprS[i]MiniBlock?
hasItem[0] = false;
hasItem[1] = false;
hasItem[2] = false;
hasItem[3] = false;
hasItem[4] = false;
hasItem[5] = false;
hasItem[6] = false;
hasItem[7] = false;
hasItem[8] = false;
hasItem[9] = false;
hasItem[10] = false;
hasItem[11] = false;
hasItem[12] = false;

var tempString,stageValue;
//loop through each item case
for (i = 0; i < 13; i += 1){
    //loop through each stage
    for (j = 0; j < ds_list_size(stageValueList); j += 1){
        stageValue = ds_list_find_value(stageValueList,j);
        if(file_find_first(global.spriteDir + "\sprS" + string(stageValue) + objName[i] + ".sprite.gmx",fa_directory) != ''){
            if (!hasItem[i]){
                hasItem[i] = true;
                writeWithBreak(f,tab + "case obj" + objName[i] + ": {");
                writeWithBreak(f,tab + tab + "switch(scrCheckRoom(room)) {");
            }
            
            tempString = tab + tab + tab + "case " + string(stageValue) + ": ";
            if (string_pos('Blocker',objName[i]) != 0)tempString += "visible = false;";
            tempString += "sprite_index = sprS" + string(stageValue) + objName[i] + ";break;";
            writeWithBreak(f,tempString)
        }
        else {}
    }
    //if has no custom block sprite
    if (!hasItem[i]){
        if (string_pos('Blocker',objName[i]) != 0)
            writeWithBreak(f,tab + "case obj" + objName[i] + ": visible = false; break;");
        else writeWithBreak(f,tab + "case obj" + objName[i] + ": break;");
    }
    //else write the closing code
    else {
        writeWithBreak(f,tab + tab + tab + "default: break;");
        writeWithBreak(f,tab + tab + "}");
        writeWithBreak(f,tab + tab + "break;");
        writeWithBreak(f,tab + "}");
    }
}

resetLog();
writeWithBreak(f,tab + "default:");
writeWithBreak(f,tab + tab + "image_speed = 0;");
writeWithBreak(f,tab + tab + "visible = false;");
writeWithBreak(f,tab + tab + "break;");
writeWithBreak(f,"}");

file_text_close(f);
