f = file_text_open_write(global.miscDir + '\config.txt');

writeWithBreak(f,"game_name=automade collab engine id=" + genRandIndex());

writeWithBreak(f,"stage_end_effect=0");
writeWithBreak(f,"stage_end_kind=0");
writeWithBreak(f,"room_end_effect=0");
writeWithBreak(f,"room_end_kind=0");
writeWithBreak(f,"game_clear_effect=0");
writeWithBreak(f,"game_clear_kind=0");
file_text_close(f);
