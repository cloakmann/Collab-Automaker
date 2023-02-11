//kills the player
//if (0 == global.difficulty){
if (global.allowHP and 0 == global.difficulty){
    //ez game mode
    global.curHP = max(0,global.curHP - 1);
    if (global.curHP > 0) {
        global.iw = false;
        audio_play_sound(sndBossHit,0,0);
        global.showHit = true;
        global.hitTimer = global.hitDuration;
        global.forcePause = 20;
        
        //x = follow.x;
        //y = follow.y;
        
        with follow {
            p = instance_create(x,y,objPlayer);
            p.hspeed = 0;
            p.vspeed = 0;
            
            instance_destroy();
        }
        //show_message("");
        instance_destroy();
        exit;
    }
    else {
        with objBow instance_destroy();
        global.iw = global.saveIw;
    }
}


if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
{
    if (global.gameStarted) //normal death
    {
        global.deathSound = audio_play_sound(sndDeath,0,false);
        
        if (!global.muteMusic)  //play death music
        {
            if (global.deathMusicMode == 1) //instantly pause the current music
            {
                audio_pause_sound(global.currentMusic);
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
            else if (global.deathMusicMode == 2)    //fade out the current music
            {                
                with (objWorld)
                    event_user(0);  //fades out and stops the current music
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
        }
        
        with (objPlayer)
        {
            instance_create(x,y,objBloodEmitter);
            instance_destroy();
        }
        
        instance_create(0,0,objGameOver);
        
        global.death += 1; //increment deaths
            
        scrSaveGame(false); //save death/time
    }
    else    //death in the difficulty select room, restart the room
    {
        with(objPlayer)
            instance_destroy();
            
        room_restart();
    }
}
