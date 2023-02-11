var roomPrefix,tempFile;
//roomPrefix = 'template/rooms/';
roomPrefix = global.templateDir + '\rooms\';

tempFile = file_text_open_read(roomPrefix + 'rTemplate.room.gmx');

var tempString;
tempString = '';

while(!file_text_eof(tempFile)){
    tempString =  file_text_read_string(tempFile);
    ds_list_add(global.roomList,tempString);
    file_text_readln(tempFile);
}

file_text_close(tempFile);

var tempLog;

tempLog = "total 1 rooms loaded";
ds_list_add(global.logList,tempLog);

/*
//test program to check if room gmx are loaded properly

tempString = 'global.roomList: #';
for (i = 0; i < ds_list_size(global.roomList); i += 1){
    tempString += ds_list_find_value(global.roomList,i) + '#';
}
show_message(tempString);
