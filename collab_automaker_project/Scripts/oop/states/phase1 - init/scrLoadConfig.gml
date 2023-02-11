var tempLog;
tempString = '';
tempLog = "Loading configs...";
ds_list_add(global.logList,tempLog);

tabLog();
//make sure config.ini is present
if (!directory_exists(global.miscDir)) {
    addLog('misc folder not found, creating a new one');
    directory_create(global.miscDir);
}
if (!file_exists(global.miscDir + '\config.txt')){
    addLog('config.ini not found, creating a new one');
    createConfig();
}

//load settings from config.ini
addLog('loading config.txt');
loadConfig();

//declare finish loading
addLog('finish');
resetLog();
