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
var offset,width,height,isBg,isWidth,isHeight,isView,containBg,sameBgLen;
var isInst,containInst,sameInstLen;
var smoothCamera;

offset = ds_list_find_value(list,0);

//width = col * 800
//height = row * 608
height = max(real(string_copy(offset,1,string_pos('_',offset) - 1)) * 608,608);
width = max(800,real(string_copy(offset,string_pos('_',offset) + 1,string_length(offset) - string_pos('_',offset))) * 800);

//show_message ('width: ' + string(width) + 'height: ' +string(height));


while (!file_text_eof(template)){
    tempString = file_text_read_string(template);
    
    toCheck = '  <width>800</width>';
    isWidth = (string_pos(toCheck,tempString) != 0);
    
    
    toCheck = '  <height>608</height>';
    isHeight = (string_pos(toCheck,tempString) != 0);
    
    toCheck = '    <view visible="-1" objName="&lt;undefined&gt;" xview="0" yview="0" wview="800" hview="608" xport="0" yport="0" wport="800" hport="608" hborder="400" vborder="304" hspeed="-1" vspeed="-1"/>';
    isView = (string_pos(toCheck,tempString) != 0);
    
    
    toCheck = '    <background visible="-1"';
    containBg = (string_pos(toCheck,tempString) != 0);
    isBg = (containBg);
    
    toCheck = '  <instances/>';
    containInst = (string_pos(toCheck,tempString) != 0);
    sameInstLen = (string_length(tempString) == string_length(toCheck))
    isInst = (containInst and sameInstLen);
    
    //replace the first background line
    if (isWidth){
        file_text_write_string(output,'  <width>' + string(width) + '</width>');
        file_text_writeln(output);
    }
    else if (isHeight){
        file_text_write_string(output,'  <height>' + string(height) + '</height>');
        file_text_writeln(output);
    }
    else if (isView) {
        //file_text_write_string(output,tempString);
        
        smoothCamera = '    <view visible="-1" objName="objSmoothCamera" xview="0" yview="0" wview="800" hview="608" xport="0" yport="0" wport="800" hport="608" hborder="400" vborder="304" hspeed="-1" vspeed="-1"/>';
        file_text_write_string(output,smoothCamera);
        file_text_writeln(output);
        
    }
    else if(isBg){
        if(file_exists(global.outputDir + '\background\' + bg + '.background.gmx')){
            tempString = '    <background visible="-1" foreground="0" ';
            tempString += 'name="' + bg + '" ';
            tempString += 'x="0" y="0" htiled="-1" vtiled="-1" hspeed="0" vspeed="0" stretch=';
            if(height > 608 or width > 800) tempString += '"1"/>';
            else tempString += '"0"/>';
            
            
            file_text_write_string(output,tempString);
            file_text_writeln(output);
        }
    }
    //insert the instance part
    else if(isInst){
        //write the instances folder's starting tag
        file_text_write_string(output,'  <instances>');
        file_text_writeln(output);
        
        smoothCamera = '    <instance objName="objSmoothCamera" x="0" y="0" name="inst_';
        smoothCamera += genRandIndex() + '" locked="0" code="" scaleX="1" scaleY="1" colour="4294967295" rotation="0"/>';
        writeWithBreak(output,smoothCamera);
        
        //write the object list into instances section
        for(i = 1; i < ds_list_size(list); i += 1){
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
