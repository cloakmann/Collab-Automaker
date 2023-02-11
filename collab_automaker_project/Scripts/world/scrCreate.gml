room_caption = "collab automaker v1.2.0";

if instance_number(object_index) > 1{
    instance_destroy();
}

global.logList = ds_list_create();
global.tabNum = 0;
global.charPerLine = 50;

/*
//load all gmx and gml needed
scrInitProj()

//load all resources
scrLoadResources();

//generate all gmx and gml related to output folder
scrGenProj()
*/
finished = false;

currentState = 'InitOutputProj';


//phase 1 - init output project, load all gms project files
//phase 2 - parse 'resources' folder, and place inside 'output' folder
//phase 3 - process project.gmx according to phase 2 data
phase = 1;

//select the range to show
maxTop = 0;
maxBottom = 0;

curTop = 0;
linesPerPage = 20;

curTotalLines = 0;

global.rootDir = working_directory;
global.templateDir = working_directory + "\template.gmx";
global.outputDir = working_directory + "\output.gmx";
global.resourceDir = working_directory + "\resources";

global.miscDir = global.resourceDir + "\misc";

//output subdirectories
global.spriteDir = global.outputDir + "\sprites";
global.roomDir = global.outputDir + "\rooms";
global.scriptDir = global.outputDir + "\scripts";
