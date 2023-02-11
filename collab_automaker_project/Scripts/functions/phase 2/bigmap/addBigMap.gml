//addBigMap(jmap_directory,map_to_store,row,col)


var mapDir,dest,row,col;
mapDir = argument0;
dest = argument1;
row = argument2;
col = argument3;

var num;
num = floor(string_length(string(mapDir)) / 50);

var tempString;
tempString = '';
for(i = 0; i < num; i += 1){
    tempString += string_copy(mapDir,i * 50,(i + 1) * 50) + "#";
}
tempString += 
string_copy(mapDir,num * 50, string_length(string(mapDir)) - num * 50 + 1);

//show_message(tempString);


var f;
tempString = '';
clipboard_set_text(mapDir);

f = file_text_open_read(mapDir);
//jump to 4th line
repeat(4)file_text_readln(f);
tempString += file_text_read_string(f);

var parseIndex,length,spaceNum,curChar,curInt,dataIndex,tempObject;
index = 0;
length = string_length(tempString);
spaceNum = 0;
curChar = '';
curInt = '';
dataIndex = 0;
parseIndex = 1;

//each jmap is parsed into a ds_list of objects
//each objects are saved in {x,y,object_index} format;


//x,y,object_index
var dx,dy,dobj,dgmx;
dx = 0;
dy = 0;
dobj = 0;
dgmx = '';



//if ds_list currently empty
//add a line of rows: xxx, cols: xxx
if(ds_list_size(dest) == 0){
    ds_list_add(dest,string(row) + '_' + string(col));
    
    //show_message("first map: " + string(ds_list_find_value(dest,0)))
    posX = real(row) * 800;
    posY = real(col) * 608;
}
//else update the line of rows: xxx, cols: xxx
else {
    var info,curRow, curCol,newRow,newCol;
    info = ds_list_find_value(dest,0);
    
    //get the row and column of original bigmap ds_list
    curRow = string_copy(info,1,string_pos('_',info) - 1);
    curCol = string_copy(info,string_pos('_',info) + 1,string_length(info) - string_pos('_',info));
    
    //update the row and column
    newRow = max(real(curRow),real(row));
    newCol = max(real(curCol),real(col));
    
    ds_list_replace(dest,0,string(newRow) + '_' + string(newCol));
}

var posX,posY;
posX = real(col) * 800 - 800;
posY = real(row) * 608 - 608;
//show_message("posX: " + string(posX) + "#posY: " + string(posY));

while(parseIndex <= length){
    
    curChar = string_char_at(tempString,parseIndex);
    switch(curChar){
            case ' ':
                switch spaceNum{
                    case 0:
                        //save x
                        dx = curInt;
                        spaceNum += 1;
                        break;
                    case 1:
                        //save y
                        dy = curInt;
                        spaceNum += 1;
                        break;
                    case 2:
                        //save corr. object index in jmap
                        dobj = curInt;
                        dgmx = '<instance objName="'+ scrGetObjIndex(dobj) + '" ';
                        dgmx += 'x="' + string(real(dx) + posX) + '" ';
                        dgmx += 'y="' + string(real(dy) + posY) + '" ';
                        dgmx += 'name="inst_' + genRandIndex() + '" ';
                        dgmx +=  'locked="0" code="" ';
                        dgmx += 'scaleX="1" scaleY="1" ';
                        dgmx += 'colour="4294967295" rotation="0"/>'
                        //ds_list_add(dest,dx + "," + dy + "," + scrGetObjIndex(dobj));
                        ds_list_add(dest,dgmx);
                        //ds_list_add(dest,genRandIndex());
                        spaceNum = 0;
                        break;                    
                }
                dataIndex += 1;
                curInt = '';
                break;
            default:
                curInt += curChar;
                break;
        }
        parseIndex += 1;
}

file_text_close(f);

//add the jmap into output/rooms folder



