//insert the lines into global.projList
tabLog();
//load the sprite list from resource folder
var gmxFolder;
gmxFolder = ds_map_create();


var tab;
tab = '  ';
var i,cur;
/*
for(cur = ds_map_find_first(global.bgMap); 
        ds_map_exists(global.bgMap,cur); 
        cur = ds_map_find_next(global.bgMap,cur)){
        */
for (i = 0; i < ds_map_size(global.bgMap); i += 1){
        cur = 's' + string(i + 1);
        //show_message("cur: " + string(cur));        
        var gmxList;
        gmxList = ds_list_create();

        ds_map_add(gmxFolder,cur,gmxList);
        
        var curList,tempString2,tempLog;
        curList = ds_map_find_value(global.bgMap,cur);
        tempString2 = cur + ":#";
        
        tempLog = "editing project.gmx: adding ";
        tempLog += string(ds_list_size(curList));
        tempLog += " background files from " + cur;
        
        addLog(tempLog);
        for(j = 0; j < ds_list_size(curList); j += 1){
            tempString2 += ds_list_find_value(curList,j) + "#";
            ds_list_add(gmxList,ds_list_find_value(curList,j));
        }
}

/*
//sort the gmxFolder ds_map according to keys
var tempMap;
tempMap = ds_map_create();
var i,srcKey,srcList;
//copy from gmxFolder first
for(i = 0; i < ds_map_size(gmxFolder); i += 1){
    srcKey = 's' + string(i + 1);
    ds_map_add(tempMap,srcKey,ds_map_find_value(gmxFolder,srcKey));
}
ds_map_clear(gmxFolder);
for(i = 0; i < ds_map_size(tempMap); i += 1){
    srcKey = 's' + string(i + 1);
    ds_map_add(tempMap,srcKey,ds_map_find_value(tempMap,srcKey));
}
*/

var i,tempString,spriteIndex;
i = 0;
spriteIndex = -1;
while (i < ds_list_size(global.projList)){
    tempString = ds_list_find_value(global.projList,i);
    if(string_pos(tab + '</backgrounds>',tempString)!= 0
     and string_length(tempString) == string_length(tab + '</backgrounds>')){
        spriteIndex = i;
     }
     i += 1;
}
//if spriteIndex != -1 show_message("found at " + string(spriteIndex));
if spriteIndex == -1 exit;

if (ds_map_size(gmxFolder) == 0){
    //ds_list_insert(global.projList,spriteIndex,tab + tab + '<backgrounds name="stages" />');
}
else {
    ds_list_insert(global.projList,spriteIndex,tab + tab + '<backgrounds name="stages">');
    var cur,lineTotal,tempString;
    lineTotal = 0;
    tempString = '';
    /*
    for (cur = ds_map_find_first(gmxFolder);
        ds_map_exists(gmxFolder,cur);
        cur = ds_map_find_next(gmxFolder,cur)
    ){
    */
    for (i = 0; i < ds_map_size(gmxFolder); i += 1){
        
        cur = 's' + string(i + 1);
        //show_message(string(i) + "#" + cur);
        var gmxList;
        gmxList = ds_map_find_value(gmxFolder,cur)
        if (ds_list_size(gmxList) == 0){
            //ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '<backgrounds name="' + cur +  '"/>');
            //lineTotal += 1;
        }
        else {
            ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '<backgrounds name="' + cur +  '">');
            lineTotal += 1;
            for (j = 0; j < ds_list_size(gmxList); j += 1){
                tempString = tab + tab + tab + tab + '<background>background\' + ds_list_find_value(gmxList,j) + '</background>';
                ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tempString);
                lineTotal += 1;
            }
            ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '</backgrounds>');
            lineTotal += 1;
        }
        
    }
    ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + '</backgrounds>');
}

resetLog();
