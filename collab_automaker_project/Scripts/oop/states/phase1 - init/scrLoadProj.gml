//proj_map = ds_list_create();
///load the project.gmx map
var raw_proj,output_proj;

var tab;
tab = '  ';

//raw_proj = file_text_open_read('template/template.project.gmx');
raw_proj = file_text_open_read(global.templateDir + '\template.project.gmx');

//global.projList
var tempString;

var curLine;
curLine = 0;

//read the template
while(!file_text_eof(raw_proj)){
    tempString = file_text_read_string(raw_proj);

    length = ds_list_size(global.projList);
    ds_list_insert(global.projList,length,tempString);
    file_text_readln(raw_proj);
}

file_text_close(raw_proj)

var tempLog;

tempLog = "finish loading project gmx file";
ds_list_add(global.logList,tempLog);


