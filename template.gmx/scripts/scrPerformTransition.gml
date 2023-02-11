//argument0 - 房间过渡的序号

//gm自带
//1 = 从左创造
//2 = 从右创造
//3 = 从上创造
//4 = 从下创造
//5 = 中心创造

//6 = 从左移动
//7 = 从右移动
//8 = 从上移动
//9 = 从下移动

//10 = 从左隔行
//11 = 从右隔行
//12 = 从上隔行
//13 = 从下隔行

//14 = 从左推
//15 = 从右推
//16 = 从上推
//17 = 从下推

//18 - 左转动
//19 - 右转动

//20 - 混合房间
//21 - 淡入淡出

//三鲜自制
//22 - 闪过灰屏并切换房间
//23 - 色调分离
//24 - 变种左转动

//伊莉提供
//25 - 翻页效果

//仿fma
//26 - 方块旋转消失

//大会随机
//27 - 黑色kid放大缩小
//28 - 多个扇形
//29 - 左右黑块闭合拉开
//30 - 下部黑色方块升起
//31 - 32x32黑色小方块随机填充

var maxScrollTime = 1.15;
var left,top,right,bottom;
left = view_xview[0];
right = view_xview[0] + view_wview[0];
top = view_yview[0];
bottom = view_yview[0] + view_hview[0];

//if(TransitionCounter < 1) {
if(
    (TransitionCounter < 1 and kind != 25)
    or 
    (TransitionCounter < 1.15 and kind == 25)
    ) {
    TransitionCounter += 0.02;
    
    //左右转动速度稍快
    if ((kind == 18 or kind == 19) and TransitionCounter < 1) {
        TransitionCounter = min(TransitionCounter + 0.01,1);
    }
    
    switch(kind){
        //gm8 自带
        //默认 - 直接切换        
        case 0:
            TransitionCounter = 1;
            break;
        
        //gm8 自带
        //1 - 从左创造
        case 1:
            draw_surface(Screenshot1, 0, 0);
            draw_surface_part(Screenshot2, 0, 0, view_wview[0] * TransitionCounter, view_hview[0], 0, 0);
            break;
        
        //gm8 自带
        //2 - 从右创造
        case 2:
            draw_surface(Screenshot1, 0, 0);
            draw_surface_part(Screenshot2, view_wview[0] - view_wview[0] * TransitionCounter, 0,
                                view_wview[0] * TransitionCounter, view_hview[0], 
                                view_wview[0] - view_wview[0] * TransitionCounter, 0);
            break;
        
        //gm8 自带
        //3 = 从上创造
        case 3:
            draw_surface(Screenshot1, 0, 0);
            draw_surface_part(Screenshot2, 0, 0,
                                //view_wview[0], view_hview[0] * TransitionCounter,
                                view_wview[0], view_hview[0] * TransitionCounter,
                                0, 0);
            break;
        
        //gm8 自带
        //4 = 从下创造
        case 4:
            draw_surface(Screenshot1, 0, 0);
            draw_surface_part(Screenshot2, 0, view_hview[0] - view_hview[0] * TransitionCounter,
                                view_wview[0], view_hview[0] * TransitionCounter,
                                0, view_hview[0] - view_hview[0] * TransitionCounter);
            break;

        //gm8 自带
        //5 = 中心创造
        case 5:
            draw_surface(Screenshot1, 0, 0);
            draw_surface_ext(Screenshot2, 
                            view_wview[0] * 0.5 * (1 - TransitionCounter), view_hview[0] * 0.5 * (1 - TransitionCounter),
                            TransitionCounter, TransitionCounter, 0, c_white,1);
            break;                
        
        //gm8 自带
        //6 = 从左移动
        case 6:
                draw_surface(Screenshot1, 0, 0);
                draw_surface_part(Screenshot2, view_wview[0] - view_wview[0] * TransitionCounter, 0, 
                                    view_wview[0] * TransitionCounter, view_hview[0], 
                                    0, 0);
                break;
        
        //gm8 自带
        //7 = 从右移动
        case 7:
                draw_surface(Screenshot1, 0, 0);
                draw_surface_part(Screenshot2, 0, 0, 
                                    view_wview[0] * TransitionCounter, view_hview[0], 
                                    view_wview[0] - view_wview[0] * TransitionCounter, 0);
                break;        
        
        //gm8 自带
        //8 = 从上移动
        case 8:
            draw_surface(Screenshot1, 0, 0);
            draw_surface_part(Screenshot2, 0, view_hview[0] - view_hview[0] * TransitionCounter,
                                view_wview[0], view_hview[0] * TransitionCounter, 0, 0);
            break;

        //gm8 自带
        //9 = 从下移动
        case 9:
            draw_surface(Screenshot1, 0, 0);
            draw_surface_part(Screenshot2, 0, 0,
                                view_wview[0], view_hview[0] * TransitionCounter, 
                                0, view_hview[0] - view_hview[0] * TransitionCounter);
            break;
        
        //gm8 自带
        //10 = 从左隔行
        case 10:
            //50格纵向
            //每帧画
            
            var index = floor(TransitionCounter / 0.02);
            var width = view_wview[0] / 50;
            
            draw_surface(Screenshot1, 0, 0);    
            
            for(var i = 0; i <index * 2; i++){
                if (i % 2) draw_surface_part(Screenshot2, i * width, 0, width, view_hview[0],i * width, 0);
                else if (i >= 50){
                    draw_surface_part(Screenshot2, (i - 50) * width, 0, width, view_hview[0],(i - 50) * width, 0);
                }
            }
            
            break;
        
        //gm8 自带
        //11 = 从右隔行
        case 11:
            //50格纵向
            //每帧画
            
            var index = floor(TransitionCounter / 0.02);
            var width = view_wview[0] / 50;
            
            draw_surface(Screenshot1, 0, 0);    
            
            for(var i = 0; i < index * 2; i++){
                if (i % 2) draw_surface_part(Screenshot2, view_wview[0] - i * width, 0, 
                                                width, view_hview[0],view_wview[0] - i * width, 0);
                else if (i >= 50){
                    draw_surface_part(Screenshot2, view_wview[0] - (i - 50) * width, 0, 
                                                width, view_hview[0],view_wview[0] - (i - 50) * width, 0);
                }
            }
            
            break;
            
        //gm8 自带
        //12 = 从上隔行
        case 12:
            //50格纵向
            //每帧画
            
            var index = floor(TransitionCounter / 0.02);
            var height = view_hview[0] / 50;
            
            draw_surface(Screenshot1, 0, 0);    
            
            for(var i = 0; i <index * 2; i++){
                //if (i % 2) draw_surface_part(Screenshot2, i * width, 0, width, view_hview[0],i * width, 0);
                if (i % 2) draw_surface_part(Screenshot2,0,i*height,view_wview[0],height,0, i*height);
                else if (i >= 50){
                    draw_surface_part(Screenshot2,0,(i - 50)*height,view_wview[0],height,0,(i - 50) * height);
                }
            }
            
            break;

        //gm8 自带
        //13 = 从下隔行
        case 13:
            //50格纵向
            //每帧画
            
            var index = floor(TransitionCounter / 0.02);
            var height = view_hview[0] / 50;
            
            draw_surface(Screenshot1, 0, 0);    
            
            for(var i = 0; i < index * 2; i++){
                if (i % 2) draw_surface_part(Screenshot2, 0, view_hview[0] - i * height, view_wview[0], 
                                                height,0,view_hview[0] - i * height);
                else if (i >= 50){
                    draw_surface_part(Screenshot2, 0, view_hview[0] - (i - 50) * height, view_wview[0], 
                                                height,0,view_hview[0] - (i - 50) * height);
                }
            }
            break;
        
        //gm8自带
        //14 = 从左推
        case 14:
            draw_surface_part(Screenshot1, 0, 0, 
                                    view_wview[0], view_hview[0], 
                                    view_wview[0] * TransitionCounter, 0);
            draw_surface_part(Screenshot2, view_wview[0] - view_wview[0] * TransitionCounter, 0, 
                                    view_wview[0] * TransitionCounter, view_hview[0], 
                                    0, 0);
            break;
        
        //gm8自带
        //15 = 从右推
        case 15:
                draw_surface_part(Screenshot1, view_wview[0] * TransitionCounter, 0, 
                                    view_wview[0] - view_wview[0] * TransitionCounter, view_hview[0], 
                                    0, 0);
                draw_surface_part(Screenshot2, 0, 0, 
                                    view_wview[0] * TransitionCounter, view_hview[0], 
                                    view_wview[0] - view_wview[0] * TransitionCounter, 0);
            break;
        
        //gm8自带
        //16 = 从上推
        case 16:
            draw_surface_part(Screenshot2, 0, view_hview[0] - view_hview[0] * TransitionCounter,
                                view_wview[0], view_hview[0] * TransitionCounter, 0, 0);
            draw_surface_part(Screenshot1, 0, 0,
                                view_wview[0], view_hview[0] - view_hview[0] * TransitionCounter, 
                                0, view_hview[0] * TransitionCounter);
            break;

        //gm8自带
        //17 = 从下推
        case 17:
            draw_surface_part(Screenshot1, 0, view_hview[0] * TransitionCounter,
                                view_wview[0], view_hview[0] - view_hview[0] * TransitionCounter, 
                                0, 0);
            draw_surface_part(Screenshot2, 0, 0,
                                view_wview[0], view_hview[0] * TransitionCounter, 
                                0, view_hview[0] - view_hview[0] * TransitionCounter);
            break;
        

            
        //gm8自带
        //18 = 左转动
        case 18:
        
            //screenshot 2's top left corner rotates from bottom right corner to top left corner
            var iniAngle = radtodeg(arctan2(-view_hview[0] / 4, view_wview[0] / 4));
            var curDif = min((TransitionCounter) * 180,180);
            var curAngle = (iniAngle + curDif) % 360;
            
            var curPortion = (1 + min(TransitionCounter,1));
            
            //screenshot 2's top left corner's radius gains from 1/2 to 1 times of half diagonal
            var iniRadius = sqrt(power(view_wview[0] / 2,2) + power(view_hview[0] / 2,2)) / 2;
            var curRadius = iniRadius * curPortion;
            
            var curTopLeftX = (view_wview[0] / 2) + lengthdir_x(curRadius,curAngle);
            var curTopLeftY = (view_hview[0] / 2) + lengthdir_y(curRadius,curAngle);
            
            draw_surface(Screenshot1,0,0);
            draw_surface_ext(Screenshot2,
                curTopLeftX,curTopLeftY,
                curPortion / 2,curPortion / 2,
                (-180 + curDif) % 360,
                c_white,1);
            
            break;
        
        //gm8自带
        //19 = 右转动
        case 19:
            
            //screenshot 2's top left corner rotates from bottom right corner to top left corner
            var iniAngle = radtodeg(arctan2(-view_hview[0] / 4, view_wview[0] / 4));
            var curDif = min((TransitionCounter) * 180,180);
            var curAngle = (iniAngle - curDif) % 360;
            
            var curPortion = (1 + min(TransitionCounter,1));
            
            //screenshot 2's top left corner's radius gains from 1/2 to 1 times of half diagonal
            var iniRadius = sqrt(power(view_wview[0] / 2,2) + power(view_hview[0] / 2,2)) / 2;
            var curRadius = iniRadius * curPortion;
            
            
            //curDif = [0,180]
            //rotation = -180->0
            
            var curTopLeftX = (view_wview[0] / 2) + lengthdir_x(curRadius,curAngle);
            var curTopLeftY = (view_hview[0] / 2) + lengthdir_y(curRadius,curAngle);
            
            draw_surface(Screenshot1,0,0);
            draw_surface_ext(Screenshot2,
                curTopLeftX,curTopLeftY,
                curPortion / 2,curPortion / 2,
                (180 - curDif) % 360,
                c_white,1);
        
            break;
            
        //gm8自带
        //20 - 混合房间
        case 20:
            draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1 - TransitionCounter);
            draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, TransitionCounter);
            break;
        
        //gm8自带
        //21 - 淡入淡出
        case 21:
            if(TransitionCounter < 0.5){
                draw_rectangle_colour(0,0,view_wview[0],view_hview[0],c_black,c_black,c_black,c_black,0);
                draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1 - 2 * TransitionCounter);
            }
            else{
                draw_rectangle_colour(0,0,view_wview[0],view_hview[0],c_black,c_black,c_black,c_black,0);
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 2 * TransitionCounter - 1);
            }
            break;
        
        //三鲜自制
        //22 - 闪屏切换            
        case 22:
            var colour = make_colour_rgb(200,200,200);
            if(TransitionCounter == 0.02)audio_play_sound(sndTransition,0,0);
            if(TransitionCounter < 0.5){
                draw_set_alpha(1 - 2 * TransitionCounter);
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 1);
                draw_rectangle_colour(0,0,view_wview[0],view_hview[0],colour,colour,colour,colour,0);
                draw_set_alpha(1);
            }
            else{
                instance_destroy();
            }
            break;
            
        //三鲜自制
        //23 - 色调分离
        case 23:
            //色调分离
            //颜色值 = 0-255 = 1-256 = 2^0 - 2^8
            //counter = 0 保留颜色值255
            //counter = 0.25 保留颜色值减半
            var ratio = 0.5 * (1/8);
            if(TransitionCounter < 0.5){
                //越趋近0.5保留颜色值越趋近于0
                var bitsToKeep = floor(TransitionCounter/ratio);
            }
            else{
                //越趋近于1保留颜色值越趋近于2^8
                var bitsToKeep = floor((1 - TransitionCounter)/ratio);
            }
            var colour = make_colour_rgb(255 / power(2,bitsToKeep),
                                                    255 / power(2,bitsToKeep),
                                                    255 / power(2,bitsToKeep));
    
            
            if(TransitionCounter < 0.5){
                draw_rectangle_colour(0,0,view_wview[0],view_hview[0],c_black,c_black,c_black,c_black,0);
                //draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1 - 2 * TransitionCounter);
                draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, colour,1);
                TransitionCounter -= 0.01;
            }
            else{
                draw_rectangle_colour(0,0,view_wview[0],view_hview[0],c_black,c_black,c_black,c_black,0);
                //draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 2 * TransitionCounter - 1);
                //if(bitsToKeep < 8)draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, colour,1);
                //else 
                //draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, c_white,1);
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, colour,1);
                if(TransitionCounter < 1)TransitionCounter -= 0.01;
            }
            break;
        
        //三鲜自制
        //24 = 变种左转动
        case 24:
            var angle = TransitionCounter * 180;
            draw_surface(Screenshot1, 0, 0);
            
            draw_surface_ext(Screenshot2,view_wview[0]*(1-TransitionCounter),view_hview[0]*(1-TransitionCounter),
            //draw_surface_ext(Screenshot2,0,0,
                    TransitionCounter,TransitionCounter,180 + angle,c_white,1);
            break;
        
        //伊莉提供
        //25 = 翻页效果
        case 25:
            var smax = 1;
            var smin = 0.2;
            var smid = (smax + smin)/2;
            var sr = (smax - smin)/2;
            var lr = 300;
            var xport = 400;
            var yport = 304;
            var angspin = pi/5; // 36 degree

            var progress = min(TransitionCounter * pi,pi);
            var cover = false;
            
            var angle1 = progress;
            var scale1 = smid + sr * cos(angle1);
            var xdif1 = xport - floor(lr * sin(angle1) * cos(angspin));
            var ydif1 = yport - floor(lr * sin(angle1) * sin(angspin));

            
            var angle2 = progress + pi;
            var scale2 = smid + sr * cos(angle2);
            var xdif2 = xport - floor(lr * sin(angle2) * cos(angspin));
            var ydif2 = yport - floor(lr * sin(angle2) * sin(angspin));
            
            var first = (TransitionCounter < 0.04);
            
            if(!cover and progress >= pi / 2)cover = true;
            
            surface_set_target(Screenshot3);
            draw_clear_alpha(c_black,1);
            
            if(cover){
                draw_surface_ext(Screenshot1,xdif1 - 400*scale1,ydif1 - 304*scale1,scale1,scale1,0,c_white,1);
            }
            
            if (!first){
                draw_surface_ext(Screenshot2,xdif2 - 400*scale2,ydif2 - 304*scale2,scale2,scale2,0,c_white,1);
            }
            
            if (!cover){
                draw_surface_ext(Screenshot1,xdif1 - 400*scale1,ydif1 - 304*scale1,scale1,scale1,0,c_white,1);
            }
            
            surface_reset_target();
            
            draw_set_blend_mode_ext(bm_one, bm_zero);
            draw_surface(Screenshot3,view_xview[0],view_yview[0]);
            draw_set_blend_mode(bm_normal);
            
            break;
        
        //仿fma
        // 26 = 方块旋转消失
        case 26:
            if(TransitionCounter < 0.5){
                draw_rectangle_colour(0,0,view_wview[0],view_hview[0],c_black,c_black,c_black,c_black,0);
                draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1 - 2 * TransitionCounter);
            }
            else{
                draw_rectangle_colour(0,0,view_wview[0],view_hview[0],c_black,c_black,c_black,c_black,0);
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 2 * TransitionCounter - 1);
                
                var curX,curY,curRadius;
                
                
                for(var i = 0; i < view_wview[0] / 32; i ++){
                    for (var j = 0; j < view_hview[0] / 32; j ++){
                        draw_sprite_ext(
                        sprTransSquare,0,
                        16 + i * 32, 16 + j * 32,
                        (1 - TransitionCounter) * 2,(1 - TransitionCounter) * 2,
                        TransitionCounter * 180,c_white,1
                        );
                    }
                }
            }
            break;
        
        //大会随机
        //27 = 黑kid放大缩小
        case 27:
            //the image_xyscale of sprBlackKid when ascending, lies within [0,100]
            var scaleAsc = min(TransitionCounter * 250, 100);
            //the image_xyscale of sprBlackKid when descending, lies within [0,100]
            var scaleDesc = max(0,(1 - TransitionCounter) * 250);
            
            if(TransitionCounter < 0.6){
                draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1);
                draw_sprite_ext(sprBlackKid,0,
                    view_xview[0] + view_wview[0]/2,view_yview[0] + view_hview[0]/2,
                    scaleAsc,scaleAsc,
                    0,c_black,1);
            }
            else {
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 1);
                draw_sprite_ext(sprBlackKid,0,
                    view_xview[0] + view_wview[0]/2,view_yview[0] + view_hview[0]/2,
                    scaleDesc,scaleDesc,
                    0,c_black,1);
            }
            break;
        
        //大会随机
        //28 - 多个扇形
        case 28: 
        //the image_xyscale of triangle when ascending, lies within [0,40]
            var scaleAsc = min(TransitionCounter * 100, 40);
            //the image_xyscale of sprBlackKid when descending, lies within [0,40]
            var scaleDesc = max(0,(1 - TransitionCounter) * 100);
            
            if(TransitionCounter < 0.6){
                draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1);
                for(i = 0;i < 10;i += 1){
                    draw_triangle_colour(view_xview[0] + view_wview[0]/2,view_yview[0] + view_hview[0]/2,
                            view_xview[0] + view_wview[0]/2 + 600*cos(degtorad(i*36)),
                            view_yview[0] + view_hview[0]/2 + 600*sin(degtorad(i*36)),
                            view_xview[0] + view_wview[0]/2 + 600*cos(degtorad(i*36 + scaleAsc)),
                            view_yview[0] + view_hview[0]/2 + 600*sin(degtorad(i*36 + scaleAsc)),
                            c_black,c_black,c_black,
                            false);
                }
            }
            else {
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 1);
                for(i = 0;i < 10;i += 1){
                    draw_triangle_color(view_xview[0] + view_wview[0]/2,view_yview[0] + view_hview[0]/2,
                            view_xview[0] + view_wview[0]/2 + 600*cos(degtorad(i*36)),
                            view_yview[0] + view_hview[0]/2 + 600*sin(degtorad(i*36)),
                            view_xview[0] + view_wview[0]/2 + 600*cos(degtorad(i*36 + scaleDesc)),
                            view_yview[0] + view_hview[0]/2 + 600*sin(degtorad(i*36 + scaleDesc)),
                            c_black,c_black,c_black,
                            false);
                }
            }
        break;
        //大会随机
        //29 - 左右黑块闭合拉开
        case 29: 
        //the image_xyscale of rectangle when ascending, lies within [0,400]
            var scaleAsc = min(TransitionCounter * 1000, 400);
            //the image_xyscale of rectangle when descending, lies within [0,400]
            var scaleDesc = max(0,(1 - TransitionCounter) * 1000);
            
            if(TransitionCounter < 0.6){
                draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1);
                draw_rectangle_color(
                view_xview[0],view_yview[0],
                view_xview[0] + scaleAsc,view_yview[0] + view_hview[0],
                c_black,c_black,c_black,c_black,
                false);
                draw_rectangle_color(
                view_xview[0] + view_wview[0] - scaleAsc,view_yview[0],
                view_xview[0] + view_wview[0],view_yview[0] + view_hview[0],
                c_black,c_black,c_black,c_black,
                false);
            }
            else {
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 1);
                draw_rectangle_color(
                view_xview[0],view_yview[0],
                view_xview[0] + scaleDesc,view_yview[0] + view_hview[0],
                c_black,c_black,c_black,c_black,
                false);
                draw_rectangle_color(
                view_xview[0] + view_wview[0] - scaleDesc,view_yview[0],
                view_xview[0] + view_wview[0],view_yview[0] + view_hview[0],
                c_black,c_black,c_black,c_black,
                false);
            }
        break;
        //大会随机
        //30 - 下部黑色方块升起
        case 30: 
            //scale 1 has 0.4 second from min to max
            var scale1 = min(TransitionCounter * 1563, 625);
            //scale 2 has 0.4 second from min to max
            var scale2 = min(max(0,(TransitionCounter - 0.6)) * 1625,650);
            
            if(TransitionCounter < 0.6){
                draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1);
                draw_rectangle_color(
                view_xview[0],view_yview[0] + view_hview[0] - scale1,
                view_xview[0] + view_wview[0],view_yview[0] + view_hview[0] - scale2,
                c_black,c_black,c_black,c_black,
                false);
            }
            else {
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 1);
                draw_rectangle_color(view_xview[0],view_yview[0] + view_hview[0] - scale1,
                view_xview[0] + view_wview[0],view_yview[0] + view_hview[0] - scale2,
                c_black,c_black,c_black,c_black,
                false);
            }
        break;
        
        //大会随机
        //31 - 32x32黑色小方块随机填充
        case 31: 
            //generate the order ds_list value [0,625] shuffled randomly
            var temp = ds_list_create();
            for(i = 0;i < 25*19;i += 1)ds_list_add(temp,i);
            ds_list_shuffle(temp);
            for(i = 0;i < 25;i += 1){
                for(j = 0;j < 19;j += 1){
                    order[i,j] = ds_list_find_value(temp,i*19 + j);
                }
            }
            
            
            ds_list_destroy(temp);
        
            //stop = [0,25]
            //change = [0,35]
            
            //so maybe we change it to [0,50]
            //[0,70] respectively?
            
            //25 * 19
            //0.50 = 25
            var time0 = min(floor(50 * TransitionCounter),25) * 19;
            var time1 = min(floor(84 * max(0,TransitionCounter - 0.7)),25) * 19;
            
            if(!time1){
                draw_surface_ext(Screenshot1, 0, 0, 1, 1, 0, 16777215, 1);
                for(var i = 0;i < 25;i += 1){
                    for(var j = 0;j < 19;j += 1){
                        if(order[i,j] < time0)
                            draw_rectangle_color(
                                view_xview[0] + i*32,view_yview[0] + j*32,
                                view_xview[0] + i*32 + 31,view_yview[0] + j*32 + 31,
                                c_black,c_black,c_black,c_black,
                                false);
                    }
                }
            }
            else{
                draw_surface_ext(Screenshot2, 0, 0, 1, 1, 0, 16777215, 1);
                for(var i = 0;i < 25;i += 1){
                    for(var j = 0;j < 19;j += 1){
                        if(order[i,j] > time1)
                            draw_rectangle_color(
                                view_xview[0] + i*32,view_yview[0] + j*32,
                                view_xview[0] + i*32 + 31,view_yview[0] + j*32 + 31,
                                c_black,c_black,c_black,c_black,
                                false);
                }
            }
        }
        break;
        
        default:
            TransitionCounter = 1;
            break;
    }

}
else {
    //instance_activate_all();
    instance_destroy();
}
