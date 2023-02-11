var tempLog;
//tempLog = "copied total " + string(global.totalFiles) + " files and ";
//tempLog += string(global.totalFolders) + " folders from engine";

tempLog = "processing project gmx";
ds_list_add(global.logList, tempLog);

file_delete(global.outputDir + "\output.project.gmx");
//proj = file_text_open_write(global.outputDir + "\output.project.gmx");

var fileName;
fileName = global.outputDir + "\" + global.projName + ".project.gmx";

proj = file_text_open_write(fileName);

var i,src,destStr,startReplace,replaceStr,tempString;
src = '<room>rooms\rEnd</room>';
dest = '<rooms name="stages">';
replaceStr = '    </rooms>';
startReplace = false;

for(i = 0; i < ds_list_size(global.projList); i += 1){
    tempString = ds_list_find_value(global.projList,i);
    
    //skip the original line of rEnd
    if(string_pos(src,tempString) != 0) continue;
    
    //place rEnd after stage folder
    if(string_pos(dest,tempString) != 0 and !startReplace) startReplace = true;
    
    //write the original line
    writeWithBreak(proj,tempString);
    
    //place rEnd line after </rooms>
    if (startReplace
     and string_pos(replaceStr,tempString) != 0
      and string_length (replaceStr) == string_length(tempString)) {
        writeWithBreak(proj,'    ' + src);
    }
}

file_text_close(proj);

//change global.startRoom in scrSetGlobalOptions
setGlobalOptions();

//edit scrGetMusic script
logMusic();

//showDS();
