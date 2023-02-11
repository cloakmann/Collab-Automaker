//parseSprite(gmx_name,spr_name,src_dir,default_width,default_height)

var gmx,name,dir,w,h,sub;


gmx = string(argument0);
name = string(argument1);
dir = string(argument2);
w =real(argument3);
h = real(argument4);

var functionCall;
functionCall = "parseSprite(" + gmx + "," + name + "," + dir + "," + string(w) + "," + string(h);

clipboard_set_text(functionCall);
//show_message(functionCall);


//get the sprite file
var tempSprite;
tempSprite = sprite_add(dir,0,0,0,0,0);

//assign the sprite into an object to draw surface
var dummy;
dummy = instance_create(0,0,objDummy);
dummy.sprite_index = tempSprite;

//if sprite_width or sprite_height is smaller than default w or h
//stretch to fit
//if width bigger than w, separate several pngs
//when loading 

var totalSub;

draw_set_blend_mode_ext(bm_one,bm_zero);

//non jumprefresher sprites
if(string_pos('fresher',name) == 0){
    totalSub = ceil (dummy.sprite_width / w);
    
    //show_message("block has total " + string(totalSub) + " subImages");
    
    var surf,surf2,subName;
    
    surf = surface_create(w,dummy.sprite_height);
    surf2 = surface_create(w,h);
    
    for(i = 0; i < totalSub; i += 1){
        //get raw image
        surface_set_target(surf);
        draw_clear_alpha(c_black,0);
        draw_sprite_part(dummy.sprite_index,0,w * i,0,w,dummy.sprite_height,0,0);
        surface_reset_target();
        
        //scale to fit
        surface_set_target(surf2);
        draw_clear_alpha(c_black,0);
        draw_surface_part_ext(
            surf,
            0,0,
            w,dummy.sprite_height,
            0,0,
            1,h / dummy.sprite_height,
            c_white,1);
        surface_reset_target();
        subName = global.outputDir + "\sprites\images\" + name + "_" + string(i) + ".png";
        surface_save(surf2,subName);
        
    }
    
    surface_free(surf);
    surface_free(surf2);
}
//jumprefresher default 1 subimage
else {
    //bbox_(left,right,top,bottom),xorigin,yorigin
    totalSub = 1;
    
    var l,r,t,b,xorig,yorig;
    l = dummy.bbox_left;
    r = dummy.bbox_right;
    t = dummy.bbox_top;
    b = dummy.bbox_bottom;
    xorig = floor((r - l) / 2);
    yorig = floor((b - t) / 2);
    
    var surf;
    surf = surface_create(r - l + 1,b - t + 1);
    
    surface_set_target(surf);
    draw_clear_alpha(c_black,0);
    draw_sprite_part(dummy.sprite_index,0,l,t,r - l + 1, b - t + 1, 0, 0);
    surface_reset_target();
    
    subName = global.outputDir + "\sprites\images\" + name + "_0.png";
    surface_save(surf,subName);
    
    surface_free(surf);
}
draw_set_blend_mode(bm_normal);

    
//get the corr. sprite gmx file
//show_message(gmx);

var tempString,tempList,f,outputFile,isset;
tempString = '';
tempList = ds_map_find_value(global.spriteMap,gmx);
isset = false;

outputFile = global.outputDir + "\sprites\" + name + ".sprite.gmx";
f = file_text_open_write(outputFile);

for(i = 0; i < ds_list_size(tempList); i += 1){
    tempString = ds_list_find_value(tempList,i);
    
    if (string_pos('fresher',name) != 0){
        if (string_pos('xorig',tempString) != 0){
            tempString = '  <xorig>' + string(xorig) + '</xorig>';
        }
        else if (string_pos('yorigin',tempString) != 0){
            tempString = '  <yorigin>' + string(yorig) + '</yorigin>';
        }
        else if (string_pos('bbox_right',tempString) != 0){
            tempString = '  <bbox_right>' + string(r - l) +  '</bbox_right>';
        }
        else if (string_pos('bbox_bottom',tempString) != 0){
            tempString = '  <bbox_bottom>' + string(b - t) +  '</bbox_bottom>';
        }
        else if (string_pos('width',tempString) != 0){
            tempString = '  <width>' + string(r - l + 1) + '</width>';
        }
        else if (string_pos('height',tempString) != 0){
            tempString = '  <height>' + string(b - t + 1) + '</height>';
        }
    }
    
    if (string_pos('<frame index="',tempString) != 0){
        if (!isset){
            for(j = 0; j < totalSub; j += 1){
                var temp;
                temp = '    <frame index="'+string(j)+'">images\';
                temp += name + "_" + string(j) + ".png</frame>";
                file_text_write_string(f,temp);
                if (j != totalSub - 1)file_text_writeln(f);
                isset = true;
            }
            file_text_writeln(f);
        }
        continue;
    }
    else {
        file_text_write_string(f,tempString);
    }
    file_text_writeln(f);
}
file_text_close(f);


with dummy instance_destroy();
//save [name]_[index].png
//save [name].sprite.gmx
