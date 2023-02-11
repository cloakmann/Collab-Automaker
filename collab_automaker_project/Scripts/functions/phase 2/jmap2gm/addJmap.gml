//addJmap(jmap_directory,map_to_store)


var mapDir,dest;
mapDir = argument0;

dest = argument1;

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
                        dgmx += 'x="' + dx + '" ';
                        dgmx += 'y="' + dy + '" ';
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
            case '.': 
                while (string_char_at(tempString,parseIndex) != ' '){
                    parseIndex += 1;
                }
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
                        dgmx += 'x="' + dx + '" ';
                        dgmx += 'y="' + dy + '" ';
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



