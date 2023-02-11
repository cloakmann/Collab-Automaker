var objectIndex;
objectIndex = argument0
//show_message("scrGetObjIndex(" + string(argument0) + ")");

switch real(objectIndex) {
    case 1: return 'objBlock';
    case 2: return 'objMiniBlock';
    case 3: return 'objSpikeUp';
    case 4: return 'objSpikeRight';
    case 5: return 'objSpikeLeft';
    case 6: return 'objSpikeDown';
    case 7: return 'objMiniUp';
    case 8: return 'objMiniRight';
    case 9: return 'objMiniLeft';
    case 10: return 'objMiniDown';
    case 11: return 'objCherry';
    case 12: return 'objSave';
    //case 13: return 'objPlatform';
    case 13: return 'objMovingPlatform';
    case 14: return 'objWater1';
    case 15: return 'objWater2';
    case 16: return 'objWalljumpL';
    case 17: return 'objWalljumpR';
    case 18: return 'objKillerBlock';
    case 19: return 'objSaveBlocker';
    case 20: return 'objPlayerStart';
    //case 21: return 'objWarp';
    case 21: return 'objWarpAutosaveNext';
    case 22: return 'objJumpRefresher';
    case 23: return 'objWater3';
    case 24: return 'objGravityUp';
    case 25: return 'objGravityDown';
    case 26: return 'objSaveFlip';
    case 27: return 'objMiniKillerBlock';
    default: return 'scrLoadCustomObjects()';
}
