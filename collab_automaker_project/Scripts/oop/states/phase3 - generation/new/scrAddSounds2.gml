//insert the lines into global.projList
tabLog();
//load the sprite list from resource folder
var gmxFolder;
gmxFolder = ds_map_create();


var tab,cur,i;
tab = '  ';

/*
for(cur = ds_map_find_first(global.soundMap); 
        ds_map_exists(global.soundMap,cur); 
        cur = ds_map_find_next(global.soundMap,cur)){
        */
for (i = 0; i < ds_map_size(global.soundMap); i += 1){
        cur = 's' + string(i + 1);        
        //show_message("cur: " + string(cur));        
        
        var gmxList;
        gmxList = ds_list_create();
        ds_map_add(gmxFolder,cur,gmxList);
        
        var curList,tempString2,tempLog;
        curList = ds_map_find_value(global.soundMap,cur);
        tempString2 = cur + ":#";
        
        //global.soundMap = [s1,s2,...]->[ri_1,ri_2,...]->[room gmx]
        tempLog = "editing project.gmx: adding ";
        tempLog += string(ds_map_size(curList));
        tempLog += " sound files from " + cur;
        
        addLog(tempLog);
        
        tabLog();
        var map;
        for(map = ds_map_find_first(curList);
        ds_map_exists(curList,map);
        map = ds_map_find_next(curList,map)
        ){
            ds_list_add(gmxList,map);
            addLog(map);
        }
        resetLog();
            
}
//find place to add sounds
var toCheck,i,tempString,roomIndex;
i = 0;
roomIndex = -1;
toCheck = '  </sounds>';
while (i < ds_list_size(global.projList)){
    tempString = ds_list_find_value(global.projList,i);
    if(string_pos(toCheck,tempString)!= 0
     and string_length(tempString) == string_length(toCheck)){
        roomIndex = i;
     }
     i += 1;
}
//if spriteIndex != -1 show_message("found at " + string(spriteIndex));
if roomIndex == -1 exit;

if (ds_map_size(gmxFolder) == 0){
    //ds_list_insert(global.projList,roomIndex,tab + tab + '<sounds name="stages" />');
}
else {
    ds_list_insert(global.projList,roomIndex,tab + tab + '<sounds name="stages">');
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
        var gmxList;
        gmxList = ds_map_find_value(gmxFolder,cur)
        if (ds_list_size(gmxList) == 0){
            //ds_list_insert(global.projList,roomIndex + lineTotal + 1,tab + tab + tab + '<sounds name="' + cur +  '"/>');
            //lineTotal += 1;
        }
        else {
            ds_list_insert(global.projList,roomIndex + lineTotal + 1,tab + tab + tab + '<sounds name="' + cur +  '">');
            lineTotal += 1;
            
            var j,tempString;
            for (j = 0; j < ds_list_size(gmxList); j += 1){
                tempString = tab + tab + tab + tab + '<sound>sound\' + ds_list_find_value(gmxList,j);
                tempString += '</sound>';
                ds_list_insert(global.projList,roomIndex + lineTotal + 1,tempString);
                lineTotal += 1;
            }
            
            ds_list_insert(global.projList,roomIndex + lineTotal + 1,tab + tab + tab + '</sounds>');
            lineTotal += 1;
        }
        
    }
    ds_list_insert(global.projList,roomIndex + lineTotal + 1,tab + tab + '</sounds>');
}

resetLog();


/*
var i,tempString,spriteIndex;
i = 0;
spriteIndex = -1;
while (i < ds_list_size(global.projList)){
    tempString = ds_list_find_value(global.projList,i);
    if(string_pos(tab + '</sounds>',tempString)!= 0
     and string_length(tempString) == string_length(tab + '</sounds>')){
        spriteIndex = i;
     }
     i += 1;
}
//if spriteIndex != -1 show_message("found at " + string(spriteIndex));
if spriteIndex == -1 exit;

if (ds_map_size(gmxFolder) == 0){
    ds_list_insert(global.projList,spriteIndex,tab + tab + '<sounds name="stages" />');
}
else {
    ds_list_insert(global.projList,spriteIndex,tab + tab + '<sounds name="stages">');
    var cur,lineTotal,tempString;
    lineTotal = 0;
    tempString = '';
    for (cur = ds_map_find_first(gmxFolder);
        ds_map_exists(gmxFolder,cur);
        cur = ds_map_find_next(gmxFolder,cur)
    ){
        var gmxList;
        gmxList = ds_map_find_value(gmxFolder,cur)
        show_message(cur);
        if (ds_map_size(gmxList) == 0){
            ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '<sounds name="' + cur +  '"/>');
            lineTotal += 1;
        }
        else {
            ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '<sounds name="' + cur +  '">');
            lineTotal += 1;
            
            ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + tab + '</sounds>');
            lineTotal += 1;
        }
        
    }
    ds_list_insert(global.projList,spriteIndex + lineTotal + 1,tab + tab + '</sounds>');
}

resetLog();
