//addLog(content)

var tempLog;

tempLog = "log: ";

for (ii = 0; ii < global.tabNum; ii += 1){
    tempLog += "    ";
}

tempLog += string(argument0);
ds_list_add(global.logList,tempLog);
