var tempLog;
tempLog = "Loading skins";
ds_list_add(global.logList, tempLog);

var i;

var stageName,tempDir,curFile;

tabLog();



for (i = 0; i < ds_list_size(global.stageList); i += 1){


    //load all stages
    stageName = ds_list_find_value(global.stageList,i)
    tempLog = "stage" + string(i + 1) + ": " + stageName;
    addLog(tempLog);
    
    tempDir = global.resourceDir + "\" + stageName + "\skins";
    
    //global.jmapMap = ds_map_create();
    var tempMapTileFolder,tempMapBgFolder,tempMap;
    
    tempMapTileFolder = ds_list_create();
    tempMapBgFolder = ds_list_create();
    
    ds_map_add(global.skinsMap,stageName,tempMapTileFolder);
    ds_map_add(global.bgMap,stageName,tempMapBgFolder);
    
    /*
    global.skinsMap = ds_map_create();
    global.bgMap = ds_map_create();
    */
    

    curFile = file_find_first(tempDir + "\*.png",fa_directory);
    if(curFile == ''){
        addLog("this folder has no png!");
    }
    else {
        var spriteCount,bgCount;
        bgCount = 0;
        spriteCount = 0;
        var tempBgString;
        var tempSpriteString;
        tempBgString = '';
        tempSpriteString = '';
        
        
        while(curFile != ''){
            if (checkSprite(curFile)){
                
                //add the corr. picture and gmx into output folder
                if (string_pos("bg.png",curFile) != 0 
                and 
                string_length(curFile) == string_length("bg.png")){
                    tempBgString += curFile + ', ';
                    parseSkin(stageName,curFile,tempDir + "\" + curFile,tempMapBgFolder);
                    bgCount += 1;
                }
                else {
                    tempSpriteString += curFile + ', ';
                    parseSkin(stageName,curFile,tempDir + "\" + curFile,tempMapTileFolder);
                    spriteCount += 1;
                }
                //add the corr. name into the folder list

            }
            curFile = file_find_next();
        }
        //insert bgTemplate if no bg.png

            
        if(bgCount == 0){
            file_copy(
                global.templateDir + '\background\images\bgTemplate.png', 
                global.resourceDir + '\' + stageName + '\skins\bg.png'
                );
            curFile = 'bg.png';
            tempBgString += curFile + ', ';
            parseSkin(stageName,curFile,tempDir + "\" + curFile,tempMapBgFolder);
            bgCount += 1;
        }
        
        //delete last comma
        var len;
        len = string_length(tempSpriteString);
        tempString = string_copy(tempSpriteString,1,len - 2);
        len -= 1;
        
        tabLog();
        for(j = 0; j < ceil(len / global.charPerLine); j += 1){
            addLog(string_copy(tempString,j * 50, min(50, len)));
        }
        resetLog();
        addLog(" total " + string(spriteCount) + " tile files");
        
        tabLog();
        addLog(string_copy(tempBgString,1,string_length(tempBgString) - 2));
        resetLog();
        addLog(" total " + string(bgCount) + " background pictures");
        resetLog();
    }
    
}
resetLog();

