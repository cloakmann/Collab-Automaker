global.totalFiles = 0;
global.totalFolders = 0;

total = scrDeepCopy(global.templateDir, global.outputDir,fa_directory);



//file_copy(global.outputDir + "\template.project.gmx",global.outputDir + "\output.project.gmx");
file_delete(global.outputDir + "\template.project.gmx");

var tempLog;
tempLog = "copied total " + string(global.totalFiles) + " files and ";
tempLog += string(global.totalFolders) + " folders from engine";

ds_list_add(global.logList, tempLog);
