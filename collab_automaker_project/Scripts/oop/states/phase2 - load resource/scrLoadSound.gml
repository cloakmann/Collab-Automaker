var tempLog;
//tempLog = "copied total " + string(global.totalFiles) + " files and ";
//tempLog += string(global.totalFolders) + " folders from engine";

tempLog = "Loading all bgms";
ds_list_add(global.logList, tempLog);

var i;

var stageName,tempDir,curFile;

tabLog();

for (i = 0; i < ds_list_size(global.stageList); i += 1){
    //load all stages
    stageName = ds_list_find_value(global.stageList,i)
    tempLog = "stage" + string(i + 1) + ": " + stageName;
    addLog(tempLog);
    tempDir = global.resourceDir + "\" + stageName + "\sound";
    
    //global.jmapMap = ds_map_create();
    var tempBgmFolder,tempList;

    //global.jmapMap = ds_map->ds_map
    tempBgmFolder = ds_map_create();
    
    ds_map_add(global.soundMap,stageName,tempBgmFolder);
    
    
    curFile = file_find_first(tempDir + "\*.mp3",fa_directory);
    
    //musS1,musS2, etc.
    var name;
    name = "mus" + string_upper(stageName);
        
    //tempMap saves the sound's gmx content into ds_list
    //e.g. (tempBgmFolder,'musS1',tempList);
    tempList = ds_list_create();
    ds_map_add(tempBgmFolder,name,tempList);
    
    tabLog();
    if(curFile == ''){
        //each stage shall have a default bgm, which is musTemplate.mp3
        addLog("no mp3 found, copy musNull instead");
        //process the sound file
        parseSound(global.templateDir + '\sound\audio\musTemplate.mp3',name,tempList);
    }
    else {
        //show_message("something");
        //only parse first mp3 file
        addLog("processing " + curFile + " to bgm");
        //process the sound file
        clipboard_set_text(tempDir + '\' + curFile);
        parseSound(tempDir + '\' + curFile,name,tempList);
    }

    resetLog();
}
resetLog();

//showDS();
