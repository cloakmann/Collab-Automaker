//this shall load all the logs in a cmd-like format in gm window
//perhaps need mouse scroll keycheck 
//to control which lines to display?



var dx,dy;
dx = 60;
dy = 35;

/*
maxTop = 0;
maxBottom = 0;

curTop = 0;
linesPerPage = 5;
*/

maxBottom = ds_list_size(global.logList);

if curTotalLines < maxBottom {
    curTotalLines = maxBottom;
    curTop = max(maxBottom - linesPerPage,0);
}

if(mouse_wheel_up())curTop = max(curTop - 1, maxTop);
if(mouse_wheel_down())curTop = max(maxTop,min(curTop + 1, maxBottom - linesPerPage));

if(keyboard_check_pressed(vk_pageup)) curTop = max(curTop - linesPerPage, maxTop);
if(keyboard_check_pressed(vk_pagedown))curTop = max(maxTop,min(curTop + linesPerPage, maxBottom - linesPerPage));

if(keyboard_check_pressed(vk_home)) curTop = 0;
if(keyboard_check_pressed(vk_end)) curTop = max(maxTop,maxBottom - linesPerPage);

for(i = curTop; i < min(curTop + linesPerPage,maxBottom); i += 1){
    tempString = ds_list_find_value(global.logList,i);
    
    //if contain Phase set as yellow
    //if contain "Exit" ,it shall be last line of log, set as magenta
    //if contain "log", it is the log under functions, set as white
    if (string_pos("Phase",tempString) != 0)color = c_yellow;
    else if (string_pos("Press",tempString) != 0)color = make_color_rgb(255,0,255);
    else if (string_pos("log",tempString)!= 0){
        color = c_white;
        //remove the "log: " part
        var pos;
        pos = string_pos("log: ",tempString);
        tempString = string_copy(tempString,pos + 5,string_length(tempString) - pos - 4)
    }
    else color = c_green;
    draw_text_color(dx,dy,tempString,color,color,color,color,1);
    
    dy += 20;
    /*
    if color == c_yellow dy += 40;
    else dy += 20;
    */
}
