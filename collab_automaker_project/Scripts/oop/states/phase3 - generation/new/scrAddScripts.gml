var tempLog;
//tempLog = "copied total " + string(global.totalFiles) + " files and ";
//tempLog += string(global.totalFolders) + " folders from engine";

tempLog = "generating the script files";
ds_list_add(global.logList, tempLog);

//generate following scripts

//scrCheckRoom
genScrCheckRoom();
//scrAutoBlockSprite
genScrAutoBlockSprites();
//ScrAutoKillerSprite
genScrAutoKillerSprites();
//ScrAutoMiscSprite
genScrAutoMiscSprites();

//add the scripts above into project.gmx

//edit the following scripts

//scrGetMusic
//scrSetGlobalOptions
