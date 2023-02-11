//load the stage folders' names
var src;
src = working_directory + "\resources";

var currentFile;
currentFile = file_find_first(global.resourceDir + "\*",fa_directory);

var tempList;
tempList = ds_list_create();

//s1 -> s123 -> s2 bug

while(currentFile != ''){
    if (currentFile != '.' and currentFile != '..'){
        if (isFolder(src + "\" + currentFile + "\") and !string_pos('misc',currentFile)){
            //ds_list_add(global.stageList,currentFile);
            ds_list_add(tempList,currentFile);
        }
    }
    currentFile = file_find_next();
}
file_find_close();

//sort the list according to index
repeat(ds_list_size(tempList)){
    ds_list_add(global.stageList,'');
}

var i;

var stageValue;
stageValue = 0;
for (i = 0; i < ds_list_size(tempList); i += 1){
    stageValue = real(string_digits(ds_list_find_value(tempList,i)));
    ds_list_replace(global.stageList,stageValue - 1,ds_list_find_value(tempList,i));
}

var tempLog;

tempLog = "total " + string(ds_list_size(global.stageList)) + " stages loaded";
ds_list_add(global.logList,tempLog);


