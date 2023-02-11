var f;

f = file_text_open_read(global.miscDir + '\config.txt');

global.projName = '';

var tempString,toCheck;
tempString = '';
toCheck = 'game_name';

var start,length;
start = 0;
length = 0;

while (!file_text_eof(f)){
    tempString = file_text_read_string(f);
    
    toCheck = 'game_name';
    if (string_pos(toCheck,tempString) != 0){
        start = string_pos('=',tempString);
        length = string_length(tempString);
        //show_message(string_copy(tempString,start + 1,length - start));
        global.projName = string_copy(tempString,start + 1,length - start);
        global.projName = checkOutputName(global.projName);
    }
    
    toCheck = 'stage_end_effect';
    if (string_pos(toCheck,tempString) != 0){
        start = string_pos('=',tempString);
        length = string_length(tempString);
        //show_message(string_copy(tempString,start + 1,length - start));
        global.stageEndEffect = string_copy(tempString,start + 1,length - start);
        
        //perform outbound check for the boolean switch
        global.stageEndEffect = checkEffect(global.stageEndEffect);
    }
    toCheck = 'stage_end_kind';
    if (string_pos(toCheck,tempString) != 0){
        start = string_pos('=',tempString);
        length = string_length(tempString);
        //show_message(string_copy(tempString,start + 1,length - start));
        global.stageEndKind = string_copy(tempString,start + 1,length - start);
        
        //perform outbound check for transition kinds
        global.stageEndKind = checkKind(global.stageEndKind);
    }
    toCheck = 'room_end_effect';
    if (string_pos(toCheck,tempString) != 0){
        start = string_pos('=',tempString);
        length = string_length(tempString);
        //show_message(string_copy(tempString,start + 1,length - start));
        global.roomEndEffect = string_copy(tempString,start + 1,length - start);
        
        //perform outbound check for the boolean switch
        global.roomEndEffect = checkEffect(global.roomEndEffect);
    }
    toCheck = 'room_end_kind';
    if (string_pos(toCheck,tempString) != 0){
        start = string_pos('=',tempString);
        length = string_length(tempString);
        //show_message(string_copy(tempString,start + 1,length - start));
        global.roomEndKind = string_copy(tempString,start + 1,length - start);
        
        //perform outbound check for transition kinds
        global.roomEndKind = checkKind(global.roomEndKind);
    }
    
    toCheck = 'game_clear_effect';
    if (string_pos(toCheck,tempString) != 0){
        start = string_pos('=',tempString);
        length = string_length(tempString);
        //show_message(string_copy(tempString,start + 1,length - start));
        global.gameClearEffect = string_copy(tempString,start + 1,length - start);
        
        //perform outbound check for the boolean switch
        global.gameClearEffect = checkEffect(global.gameClearEffect);
    }
    
    toCheck = 'game_clear_kind';
    if (string_pos(toCheck,tempString) != 0){
        start = string_pos('=',tempString);
        length = string_length(tempString);
        //show_message(string_copy(tempString,start + 1,length - start));
        global.gameClearKind = string_copy(tempString,start + 1,length - start);
        
        //perform outbound check for transition kinds
        global.gameClearKind = checkKind(global.gameClearKind);
    }
    
    file_text_readln(f);
}

file_text_close(f);
