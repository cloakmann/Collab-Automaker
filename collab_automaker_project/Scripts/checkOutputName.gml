//checkOutputName(name)

var name,output;
name = argument0;
output = '';

if (name == '')return ("automade collab engine id=" + genRandIndex());
else {
    output = name;
    output = string_replace(output,'\','_');
    output = string_replace(output,'/','_');
    output = string_replace(output,':','_');
    output = string_replace(output,'*','_');
    output = string_replace(output,'?','_');
    output = string_replace(output,'"','_');
    output = string_replace(output,'<','_');
    output = string_replace(output,'>','_');
    return output;
}
