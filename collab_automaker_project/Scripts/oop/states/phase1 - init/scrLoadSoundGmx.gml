
var sndPrefix,tempFile;
//sndPrefix = 'template/sound/';
sndPrefix = global.templateDir + '\sound\';

//the sound file needed to be loaded
tempFile = file_text_open_read(sndPrefix + 'musTemplate.sound.gmx');

var tempString;
tempString = '';

//load the template sound file
while(!file_text_eof(tempFile)){
    tempString = file_text_read_string(tempFile);
    ds_list_add(global.soundList,tempString);
    file_text_readln(tempFile);
}

file_text_close(tempFile);


//test program to check if music gmx are loaded properly
/*
tempString = 'global.soundList: #';
for (i = 0; i < ds_list_size(global.soundList); i += 1){
    tempString += ds_list_find_value(global.soundList,i) + '#';
}
show_message(tempString);


