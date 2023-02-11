//insert the lines into global.projList
tabLog();
//load the sprite list from resource folder
var gmxFolder;
gmxFolder = ds_map_create();

var tab;
tab = '  ';
var cur;
/*
for(cur = ds_map_find_first(global.skinsMap); 
        ds_map_exists(global.skinsMap,cur); 
        cur = ds_map_find_next(global.skinsMap,cur)){
        
        //show_message("cur: " + string(cur));        
        
        var gmxList;
        gmxList = ds_list_create();
        //ds_map_add(gmxFolder,cur,gmxList);
        ds_map_add(tempFolder,cur,gmxList);
        
        var curList,tempString2,tempLog;
        curList = ds_map_find_value(global.skinsMap,cur);
        tempString2 = cur + ":#";
        
        tempLog = "editing project.gmx: adding ";
        tempLog += string(ds_list_size(curList));
        tempLog += " sprite files from " + cur;
        
        addLog(tempLog);
        for(j = 0; j < ds_list_size(curList); j += 1){
            tempString2 += ds_list_find_value(curList,j) + "#";
            ds_list_add(gmxList,ds_list_find_value(curList,j));
        }
}
*/

var i;
for(i = 0; i < ds_map_size(global.skinsMap); i += 1){
        cur = 's' + string(i + 1);
        //show_message("cur: " + string(cur));        
        
        var gmxList;
        gmxList = ds_list_create();
        ds_map_add(gmxFolder,cur,gmxList);
        //ds_map_add(tempFolder,cur,gmxList);
        
        var curList,tempString2,tempLog;
        curList = ds_map_find_value(global.skinsMap,cur);
        tempString2 = cur + ":#";
        
        tempLog = "editing project.gmx: adding ";
        tempLog += string(ds_list_size(curList));
        tempLog += " sprite files from " + cur;
        
        addLog(tempLog);
        for(j = 0; j < ds_list_size(curList); j += 1){
            tempString2 += ds_list_find_value(curList,j) + "#";
            ds_list_add(gmxList,ds_list_find_value(curList,j));
        }
}




var i,tempString,spriteIndex;
i = 0;
spriteIndex = -1;
while (i < ds_list_size(global.projList)){
    tempString = ds_list_find_value(global.projList,i);
    if(string_pos(tab + '</sprites>',tempString)!= 0
     and string_length(tempString) == string_length(tab + '</sprites>')){
        spriteIndex = i;
     }
     i += 1;
}
//if spriteIndex != -1 show_message("found at " + string(spriteIndex));
if spriteIndex == -1 exit;

if (ds_map_size(gmxFolder) == 0){
    //ds_list_insert(global.projList,spriteIndex,tab + tab + '<sprites name="stages" />');
}
else {
    ds_list_insert(global.projList,spriteIndex,tab + tab + '<sprites name="stages">');
    var cur,lineTotal,tempString;
    lineTotal = 0;
    tempString = '';
    /*
    for (cur = ds_map_find_first(gmxFolder);
        ds_map_exists(gmxFolder,cur);
        cur = ds_map_find_next(gmxFolder,cur)
    ){
    */
    var j;
    for (j = 0; j < ds_map_size(gmxFolder); j += 1){
        cur = 's' + string(j + 1);
        var gmxList;
        gmxList = ds_map_find_value(gmxFolder,cur)
        //show_message(cur + ": " + string(ds_list_size(gmxList)));
        if (ds_list_size(gmxList) == 0){
            //ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '<sprites name="' + cur +  '"/>');
            //lineTotal += 1;
        }
        else {
            ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '<sprites name="' + cur +  '">');
            lineTotal += 1;
            for (k = 0; k < ds_list_size(gmxList); k += 1){
                tempString = tab + tab + tab + tab + '<sprite>sprites\' + ds_list_find_value(gmxList,k) + '</sprite>';
                ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tempString);
                lineTotal += 1;
            }
            ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '</sprites>');
            lineTotal += 1;
        }
        
    }
    ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + '</sprites>');
}

resetLog();
//showDS();
