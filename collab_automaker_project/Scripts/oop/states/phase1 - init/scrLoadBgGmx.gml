var sndPrefix,tempFile;
//bgPrefix = 'template\background\';
bgPrefix = global.templateDir + '\background\';


//background gmx that needs to be loaded
tempFile = file_text_open_read(bgPrefix + 'bgTemplate.background.gmx');

var tempString;
tempString = '';
//load the gmx
while(!file_text_eof(tempFile)){
    tempString =  file_text_read_string(tempFile);
    ds_list_add(global.bgList,tempString);
    file_text_readln(tempFile);
}
file_text_close(tempFile);
var tempLog;
tempString = '';
tempLog = "total 1 background gmx loaded";
ds_list_add(global.logList,tempLog);

//test program to check if bg are loaded properly
var tempList;
