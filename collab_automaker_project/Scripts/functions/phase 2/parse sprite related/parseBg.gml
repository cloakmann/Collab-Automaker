//parseBg(bg_name,src_dir)

var name,dir;

name = argument0;
dir = argument1;

var tempSprite;
tempSprite = sprite_add(dir,0,0,0,0,0);

var i;
i = instance_create(0,0,objDummy);
i.sprite_index = tempSprite;

var surf,w,h;
w = 800;
h = 608;

surf = surface_create(w,h);
surface_set_target(surf);
draw_clear_alpha(c_black,0);
draw_sprite_ext(i.sprite_index,0,0,0,w / i.sprite_width, h / i.sprite_height,0,c_white,1);
surface_reset_target();

surface_save(surf,global.outputDir + "\background\images\" + name + ".png");


with i instance_destroy();

surface_free(surf);

//write a new bg gmx
var f;
//f = file_text_open_write(global.rootDir + "\" + name + ".background.gmx");
f = file_text_open_write(global.outputDir + "\background\" + name + ".background.gmx");

var tempString;
tempString = '';

for(i = 0; i < ds_list_size(global.bgList); i += 1){
    tempString = ds_list_find_value(global.bgList,i);
    if(string_pos('<width>',tempString) != 0){
        tempString = '  <width>' + string(w) + '</width>';
    }
    if(string_pos('<height>',tempString) != 0){
        tempString = '  <height>' + string(h) + '</height>';
    }
    if(string_pos('<data>',tempString) != 0){
        tempString = '  <data>images\' + name + '.png</data>';
    }
    file_text_write_string(f,tempString);
    file_text_writeln(f);
}

file_text_close(f);
