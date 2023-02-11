var tempLog;
//tempLog = "copied total " + string(global.totalFiles) + " files and ";
//tempLog += string(global.totalFolders) + " folders from engine";

tempLog = "Loading all jmaps";
ds_list_add(global.logList, tempLog);

var i;

var stageName,tempDir,curFile;

tabLog();

for (i = 0; i < ds_list_size(global.stageList); i += 1){
    //load all stages
    stageName = ds_list_find_value(global.stageList,i)
    tempLog = "stage" + string(i + 1) + ": " + stageName;
    addLog(tempLog);
    tempDir = global.resourceDir + "\" + stageName + "\maps";
    
    //global.jmapMap = ds_map_create();
    var tempMapFolder,tempMap;

    //global.jmapMap = ds_map->ds_map
    tempMapFolder = ds_map_create();
    
    ds_map_add(global.jmapMap,stageName,tempMapFolder);
    
    tabLog();
    curFile = file_find_first(tempDir + "\*.jmap",fa_directory);
    var count;
    count = 0;
    if(curFile == '')
        addLog("this folder has no jmaps!");
    else {
    
        //print all jmap files and total number of jmaps
        while(curFile != ''){
            addLog(curFile);
            count += 1;
            tempMap = ds_list_create();
            
            var name;
            //r1_1,r2_1,etc.
            name = "r" + string(i + 1) + "_" + string(count);
            ds_map_add(tempMapFolder,name,tempMap);
            
            //for each map found, parse them into a new map
            addJmap(tempDir + "\" + curFile,tempMap);
            //for each tempMap ds_list, do jmap2GM
            jmap2GM(name,tempMap,stageName);
            
            curFile = file_find_next();
            
        }
        addLog(" total " + string(count) + " jmap files");
    }
    
    //load bigmaps
    
    //list of names of big maps
    var bigMapName,tempName,iniCount;
    bigMapName = ds_map_create();
    iniCount = count;
    
    
    curFile = file_find_first(tempDir + "\*.bigmap",fa_directory);
    if(curFile == '')
        addLog("this folder has no big room jmaps!");
    else {
        var tempString,row,col;
        //print all jmap files and total number of jmaps
        while(curFile != ''){
            addLog(curFile);
            tempMap = ds_list_create();
            
            var name;
            //r1_1,r2_1,etc.
            
            tempName = string_copy(curFile,1,string_pos("^",curFile) - 1);
            
            
            //show_message ('tempName: ' + string(tempName) + "#name: " + string(name) + "#" + string(count));

            //name = ri_j
            if (!ds_map_exists(bigMapName,tempName)){
                //show_message('not found ' + string(count));
                tempMap = ds_list_create();
                count += 1;
                name = "r" + string(i + 1) + "_" + string(count) + "b";
                ds_map_add(bigMapName,tempName,name);
                ds_map_add(tempMapFolder,name,tempMap);
            }
            else {
                //show_message('found ' + string(count));
                tempMap = ds_map_find_value(tempMapFolder,name);
            }
            
            tempString = curFile;
            
            tempString = string_copy(curFile,string_pos("^",curFile) + 1, string_length(curFile) - string_pos("^",curFile));
            
            row = string_copy(tempString,1,string_pos("^",tempString) - 1);
            
            tempString = string_copy(tempString,string_pos("^",tempString) + 1, string_length(tempString) - string_pos("^",tempString));
            
            col = string_copy(tempString,1,string_pos(".b",tempString) - 1);

            //show_message("bigmap: " + curFile + "#rows: " + string(row) + "#columns: " + string(col));
            
            addBigMap(tempDir + "\" + curFile,tempMap,row,col);
            curFile = file_find_next();   
        }
        
        //get through each bigMapName ds_map to get the keys in the tempMapFolder
        //with keys and tempMapFolder we get corr. bigMap ds_list 'tempMap'
        //bigMap2GM(name,tempMap,stageName);
        var cur,curName,curMap;
        for(cur = ds_map_find_first(bigMapName);
            ds_map_exists(bigMapName,cur);
            cur = ds_map_find_next(bigMapName,cur)){
            
            curName = ds_map_find_value(bigMapName,cur);
            //show_message('curName: ' + curName);
            curMap = ds_map_find_value(tempMapFolder,curName);
            
            //get the size of curMap in screens
            var _pos;
            _pos = string_pos('_',tempString);
            tempString = ds_list_find_value(curMap,0);
            row = string_copy(tempString,1,_pos - 1);
            col = string_copy(tempString, _pos + 1, string_length(tempString) - _pos - 1);
            
            addLog("generating bigmap: " + curName);
            addLog("    with width " + col + "screens");
            addLog("    and height " + row + "screens");
            bigMap2GM(curName,curMap,stageName);
        }
        
        addLog(" total " + string(count - iniCount) + " bigmaps");
    }
    

    resetLog();
}
resetLog();

//showDS();
