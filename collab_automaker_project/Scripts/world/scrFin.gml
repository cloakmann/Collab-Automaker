var newMap,newList;

//id for ds_map and ds_list are all incremental int
//so delete from 0 to newest shall do the trick
newMap = ds_map_create();
newList = ds_list_create();

for (i = 0; i <= newMap; i += 1){
    ds_map_clear(i);
    ds_map_destroy(i);
}

for (i = 0; i <= newList; i += 1){
    ds_list_clear(i);
    ds_list_destroy(i);
}

for(i = 0; sprite_exists(i); i += 1){
    sprite_delete(i);
}
