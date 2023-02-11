//jmap2GM(room_name,map_ds_list,stage_name)

var name,list,stage;
name = argument0;
list = argument1;
stage = argument2;

var template;
template = file_text_open_read(global.templateDir + "\rooms\rTemplate.room.gmx");


var bg,output,i,tempString;

//get the background name for this stage
bg = "bg" + string_upper(stage);

//show_message("bg" + string_upper(stage));
//output = file_text_open_write("demo rooms\" + name + ".room.gmx");
output = file_text_open_write(global.roomDir + "\" + name + ".room.gmx");

//isBg - whether reach the place to insert the background gmx
//isInst - whether reach 

var toCheck;
var isBg,containBg,sameBgLen;
var isInst,containInst,sameInstLen;
while (!file_text_eof(template)){
    tempString = file_text_read_string(template);
    toCheck = '    <background visible="-1"';
    containBg = (string_pos(toCheck,tempString) != 0);
    isBg = (containBg);
    
    toCheck = '  <instances/>';
    containInst = (string_pos(toCheck,tempString) != 0);
    sameInstLen = (string_length(tempString) == string_length(toCheck))
    isInst = (containInst and sameInstLen);
    
    //replace the first background line
    if(isBg){
        if(file_exists(global.outputDir + '\background\' + bg + '.background.gmx')){
            tempString = '    <background visible="-1" foreground="0" ';
            tempString += 'name="' + bg + '" ';
            tempString += 'x="0" y="0" htiled="-1" vtiled="-1" hspeed="0" vspeed="0" stretch="0"/>'
            file_text_write_string(output,tempString);
            file_text_writeln(output);
        }
    }
    //insert the instance part
    else if(isInst){
        //write the instances folder's starting tag
        file_text_write_string(output,'  <instances>');
        file_text_writeln(output);
        
        //write the object list into instances section
        for(i = 0; i < ds_list_size(list); i += 1){
        //for(i = 0; i < 2; i += 1){
            tempString = ds_list_find_value(list,i);
            file_text_write_string(output,'    ' + tempString);
            file_text_writeln(output);
        }
        
        //write the instances folder's finish tag
        file_text_write_string(output,'  </instances>');
        file_text_writeln(output);
    }
    //otherwise copy other sections of rTemplate
    else {
        file_text_write_string(output,tempString);
        file_text_writeln(output);
    }
    file_text_readln(template);
}


/*
for(i = 0; i < ds_list_size(list); i += 1){
    tempString = ds_list_find_value(list,i);
    file_text_write_string(output,tempString);
    file_text_writeln(output);
}
*/

file_text_close(template);
file_text_close(output);
