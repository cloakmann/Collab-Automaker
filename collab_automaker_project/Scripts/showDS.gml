//show all ds_map and ds_list and save in a ds.txt file
var tab;
tab = "    ";


outputList = ds_list_create();
outputMap = ds_list_create();

//load all ds_lists
var i,j;
for (i = 0; i < outputList; i += 1){
    for(j = 0; j < ds_list_size(i); j += 1){
        ds_list_add(outputList,ds_list_find_value(i,j));
    }
    ds_list_add(outputList,'');
}

if(ds_list_size(outputList) > 0){
    f = file_text_open_write("ds_list.txt");
    for(i = 0; i < ds_list_size(outputList); i += 1){
        file_text_write_string(f,ds_list_find_value(outputList,i));
        file_text_writeln(f);
    }
file_text_close(f);
}

//load all ds_maps
var i,j;
newMap = ds_map_create();
ds_map_destroy(newMap);
//show_message(string(newMap));

for(i = 0; i < newMap; i += 1){
    if(ds_map_size(i) > 0){
        var first,last,cur;
        first = ds_map_find_first(i);
        last = ds_map_find_last(i);
        cur = first
        while(cur != last){
            ds_list_add(outputMap,string(cur));
            cur = ds_map_find_next(i,cur);
        }
        ds_list_add(outputMap,string(last));
        ds_list_add(outputMap,'');
    }
}
if(ds_list_size(outputMap) > 0){
    f = file_text_open_write("ds_map.txt");
    
    for(i = 0; i < ds_list_size(outputMap); i += 1){
        file_text_write_string(f,ds_list_find_value(outputMap,i));
        file_text_writeln(f);
    }
    
    file_text_close(f);
}
