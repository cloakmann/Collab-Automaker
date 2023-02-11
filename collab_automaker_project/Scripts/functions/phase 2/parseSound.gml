//parseSound(src_dir,sound_name,gmx_ds_list)

var src,name,gmx;
src = argument0;
name = argument1;
gmx = argument2;

//show_message(src + "#" + name);

//copy the file directly to output
file_copy(src,global.outputDir + '\sound\audio\'+name + ".mp3");

//generate the gmx file
var list;
list = global.soundList;

var f;
//write a new gmx file
f = file_text_open_write(global.outputDir + '\sound\' + name + ".sound.gmx");

var i,tempString,toCheck,changeOrig,changeData;
for (i = 0; i < ds_list_size(list); i += 1){
    tempString = ds_list_find_value(list,i);
    
    toCheck = "  <origname>";
    changeOrig = (string_pos(toCheck,tempString) != 0);
    
    toCheck = "  <data>";
    changeData = (string_pos(toCheck,tempString) != 0);
    
    
    if (changeOrig){
        //show_message(name + 'change origname');
        file_text_write_string(f,'  <origname>sound\audio\'+name+'.mp3</origname>');
        file_text_writeln(f);
    }
    else if(changeData){
        //show_message(name + 'change data');
        file_text_write_string(f,'  <data>'+name+'.mp3</data>');
        file_text_writeln(f);
    }
    else {
        file_text_write_string(f,tempString);
        file_text_writeln(f);
    }
}

file_text_close(f);
