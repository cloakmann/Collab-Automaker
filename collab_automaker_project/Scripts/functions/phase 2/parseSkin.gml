//parseSprite(stage,name,dir,list)
//get the file in name
//parse the file and add to output folder according to name

//checkSprite(name);
//check the input name is of jmap sprite format

var stage,name,file,list,outputName;

outputName ='';
stage = argument0;
name = argument1;
file = argument2;
list = argument3;

//parseSprite(spr_name,src_dir,default_width,default_height,default_subImages)
//parseBg(bg_name,src_dir)

switch(name){
    case 'bg.png':
        outputName = 'bg' + string_upper(stage);
        parseBg(outputName,file);
        ds_list_add(list,outputName);
        break;
    case 'block.png':
        outputName = 'spr' + string_upper(stage) + "Block";
        parseSprite("sprBlockMask",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'miniblock.png':
        outputName = 'spr' + string_upper(stage) + "MiniBlock";
        parseSprite("sprMiniBlockMask",outputName,file,16,16);
        ds_list_add(list,outputName);
        break;
    case 'spikeup.png':
        outputName = 'spr' + string_upper(stage) + "SpikeUp";
        parseSprite("sprSpikeUp",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'spikeright.png':
        outputName = 'spr' + string_upper(stage) + "SpikeRight";
        parseSprite("sprSpikeRight",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'spikeleft.png':
        outputName = 'spr' + string_upper(stage) + "SpikeLeft";
        parseSprite("sprSpikeLeft",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'spikedown.png':
        outputName = 'spr' + string_upper(stage) + "SpikeDown";
        parseSprite("sprSpikeDown",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'miniup.png':
        outputName = 'spr' + string_upper(stage) + "MiniUp";
        parseSprite("sprMiniUp",outputName,file,16,16);
        ds_list_add(list,outputName);
        break;
    case 'miniright.png':
        outputName = 'spr' + string_upper(stage) + "MiniRight";
        parseSprite("sprMiniRight",outputName,file,16,16);
        ds_list_add(list,outputName);
        break;
    case 'minileft.png':
        outputName = 'spr' + string_upper(stage) + "MiniLeft";
        parseSprite("sprMiniLeft",outputName,file,16,16);
        ds_list_add(list,outputName);
        break;
    case 'minidown.png':
        outputName = 'spr' + string_upper(stage) + "MiniDown";
        parseSprite("sprMiniDown",outputName,file,16,16);
        ds_list_add(list,outputName);
        break;
    case 'apple.png':
        outputName = 'spr' + string_upper(stage) + "Cherry";
        parseSprite("sprCherry",outputName,file,21,24);
        ds_list_add(list,outputName);
        break;
    case 'save.png':
        outputName = 'spr' + string_upper(stage) + "Save";
        parseSprite("sprSave",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'platform.png':
        outputName = 'spr' + string_upper(stage) + "Platform";
        parseSprite("sprPlatform",outputName,file,32,16);
        ds_list_add(list,outputName);
        break;
    case 'water1.png':
        outputName = 'spr' + string_upper(stage) + "Water";
        parseSprite("sprWater",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'water2.png':
        outputName = 'spr' + string_upper(stage) + "Water2";
        parseSprite("sprWater",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'walljumpL.png':
        outputName = 'spr' + string_upper(stage) + "WalljumpL";
        parseSprite("sprWalljumpL",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'walljumpR.png':
        outputName = 'spr' + string_upper(stage) + "WalljumpR";
        parseSprite("sprWalljumpR",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'killerblock.png':
        outputName = 'spr' + string_upper(stage) + "KillerBlock";
        parseSprite("sprKillerBlock",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'saveblocker.png':
        outputName = 'spr' + string_upper(stage) + "SaveBlocker";
        parseSprite("sprSaveBlocker",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'playerstart.png':
        outputName = 'spr' + string_upper(stage) + "PlayerStart";
        parseSprite("sprPlayerStart",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'warp.png':
        outputName = 'spr' + string_upper(stage) + "Warp";
        parseSprite("sprWarp",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'jumprefresher.png':
        outputName = 'spr' + string_upper(stage) + "JumpRefresher";
        //parseSprite("sprJumpRefresher",outputName,file,13,13);
        parseSprite("sprJumpRefresher",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'water3.png':
        outputName = 'spr' + string_upper(stage) + "Water3";
        parseSprite("sprWater",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'gravityarrowup.png':
        outputName = 'spr' + string_upper(stage) + "GravityUp";
        parseSprite("sprGravityUp",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'gravityarrowdown.png':
        outputName = 'spr' + string_upper(stage) + "GravityDown";
        parseSprite("sprGravityDown",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'saveflip.png':
        outputName = 'spr' + string_upper(stage) + "SaveFlip";
        parseSprite("sprSaveFlip",outputName,file,32,32);
        ds_list_add(list,outputName);
        break;
    case 'minikillerblock.png':
        outputName = 'spr' + string_upper(stage) + "SaveFlip";
        parseSprite("sprMiniKillerBlock",outputName,file,16,16);
        ds_list_add(list,outputName);
        break;
}

//show_message("input: " + name + "#output: " + outputName);
