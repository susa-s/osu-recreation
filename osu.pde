//Spencer Wells, Lab 5

//NOTE: THE MINIM & SOUND LIBRARIES ARE NEEDED FOR THIS PROGRAM TO WORK
//TO INSTALL, CLICK ON 'SKETCH' IN THE TOP LEFT, 'IMPORT LIBRARY' AND 'ADD LIBRARY' 
//TYPE 'MINIM' IN THE SEARCH BAR, AND INSTALL THE MINIM LIBRARY
//TYPE 'SOUND' IN THE SEARCH BAR, AND INSTALL THE SOUND LIBRARY
//ONCE YOU HAVE BOTH LIBRARIES INSTALLED, YOU'LL BE GOOD TO GO
import processing.sound.*;
import ddf.minim.*;

ArrayList<Circle> circles;
ArrayList<Circle> dead;
  
float x [];
float y [];

int threeHundred = 0;
int oneHundred = 0;
int fifty = 0;
int misses = 0;
int totalNotes = 0;

int combo = 0;
int highestCombo = 0;

int update = 1;

int contX = 380;
int contX2 = 240;
int retryX = 380;
int retryX2 = 240;
int quitX = 380;
int quitX2 = 240;

int cont2X = 380;
int cont2X2 = 240;
int retry2X = 380;
int retry2X2 = 240;
int quit2X = 380;
int quit2X2 = 240;

int cont3X = 380;
int cont3X2 = 240;
int retry3X = 380;
int retry3X2 = 240;
int quit3X = 380;
int quit3X2 = 240;


float accuracy;

boolean hardMode = false;
boolean pause = false;
boolean IMRPause = false;
boolean HCPause = false;
boolean YYPause = false;

Minim songs;

Minim hitSounds;
AudioPlayer playMenuHit, playReturnHit, playSongClick, playHitSound, harumachiClover, inMyRoom, yomiYori, endSong;

PImage InMyRoomBG, InMyRoomPause;
PImage HarumachiCloverBG,HarumachiCloverPause;
PImage YomiYoriBG, YomiYoriPause;

InMyRoom IMR;
HarumachiClover HC;
YomiYori YY;

Menu menu;
Cursor cursor; 

void setup(){
  size(1000,800);
  
  menu = new Menu(1000,800);
  cursor = new Cursor();
  
  songs = new Minim(this);
  
  inMyRoom = songs.loadFile("songs/InMyRoom.wav");
  harumachiClover = songs.loadFile("songs/HarumachiClover.wav");
  yomiYori = songs.loadFile("songs/YomiYori.mp3");
  
  endSong = songs.loadFile("songs/end.wav");
  
  hitSounds = new Minim(this);
  playMenuHit = hitSounds.loadFile("sounds/menuhit.wav");
  playReturnHit = hitSounds.loadFile("sounds/menuback.wav");
  playSongClick = hitSounds.loadFile("sounds/songclick.wav");
  playHitSound = hitSounds.loadFile("sounds/hitsound.mp3");
  
  InMyRoomBG = loadImage("backgrounds/inmyroom.jpg");
  InMyRoomPause = loadImage("backgrounds/inmyroomPause.jpg");
  HarumachiCloverBG = loadImage("backgrounds/harumachi.jpg");
  HarumachiCloverPause = loadImage("backgrounds/harumachiPause.jpg");
  YomiYoriBG = loadImage("backgrounds/yomiyori.jpg");
  YomiYoriPause = loadImage("backgrounds/yomiyoriPause.jpg");
  
  frameRate(120);
  
}

void draw(){  
  if(menu.exit()){
    exit();
  }
  
  if(menu.getMode()<=1){
    menu.draw();
  }
  else if(menu.getMode() == 2){
    background(InMyRoomBG);
    
    stroke(255);
    strokeWeight(3);
    noFill();
    rect(75,75,850,650); 
    IMR.draw();
    if(!inMyRoom.isPlaying() && !pause){
      menu.setMode(-1);
    }
    if(pause){
      IMRPause = true;
      update = 0;
      background(InMyRoomPause);
      stroke(250);
      strokeWeight(3);
      noFill();
      rect(75,75,850,650);
      inMyRoom.pause();
      
      stroke(0,255,255,100);
      strokeWeight(10);
      fill(255);
      rect(350,200,300,400,10,10,10,10);
      
      stroke(140,38,20);
      strokeWeight(5);
      fill(0,255,255);
      rect(cont2X,235,cont2X2,70,10,10,10,10);
      rect(retry2X,360,retry2X2,70,10,10,10,10);
      rect(quit2X,485,quit2X2,70,10,10,10,10);
      strokeWeight(4);
      rect(435,160,125,45,10,10,10,10);
      
      fill(140,38,20);
      textSize(45);
      text("Continue",400,285);
      text("Retry",440,410);
      text("Quit",450,535);
      
      textSize(35);
      text("Pause",450,195);  
      
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 235 && cursor.getY() < 305){
        if(cont2X>372){
          cont2X--;
          cont2X2+=2;
        }
        if(mousePressed){
          IMRPause = false;
          menu.menuClicked();
          menu.setMode(-102);
          cont2X=380;
          cont2X2=240;
        }
      }else{
        if(cont2X<380){
          cont2X++;
          cont2X2-=2;
        }
      }
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 360 && cursor.getY() < 430){
        if(retry2X>372){
          retry2X--;
          retry2X2+=2;
        }
        if(mousePressed){
          IMRPause = false;
          pause = false;
          update = 1;
          IMR = new InMyRoom(75,0,0.87,0.41);
          menu.setMode(2);
          clear();
          menu.songClicked();
          inMyRoom.rewind();
          inMyRoom.play();
          retry2X=380;
          retry2X2=240;
        }
      }else{
        if(retry2X<380){
          retry2X++;
          retry2X2-=2;
        }
      }
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 485 && cursor.getY() < 555){
        if(quit2X>372){
          quit2X--;
          quit2X2+=2;
        }
        if(mousePressed){
          IMRPause = false;
          update = 1;
          pause = false;
          clear();
          inMyRoom.rewind();
          menu.returnClicked();
          menu.setMode(1);
          quit2X=380;
          quit2X2=240;
          hardMode=false;
        }
      }else{
        if(quit2X<380){
          quit2X++;
          quit2X2-=2;
        }
      }
    }
  }
  else if(menu.getMode() == 3){
    background(HarumachiCloverBG);
    
    stroke(255);
    strokeWeight(3);
    noFill();
    rect(75,75,850,650);
    HC.draw();
    if(!harumachiClover.isPlaying() && !pause){
      menu.setMode(-2);
    }
    if(pause){
      HCPause = true;
      update = 0;
      background(HarumachiCloverPause);
      stroke(250);
      strokeWeight(3);
      noFill();
      rect(75,75,850,650);
      harumachiClover.pause();
      
      stroke(0,255,255,100);
      strokeWeight(10);
      fill(255);
      rect(350,200,300,400,10,10,10,10);
      
      stroke(140,38,20);
      strokeWeight(5);
      fill(0,255,255);
      rect(contX,235,contX2,70,10,10,10,10);
      rect(retryX,360,retryX2,70,10,10,10,10);
      rect(quitX,485,quitX2,70,10,10,10,10);
      strokeWeight(4);
      rect(435,160,125,45,10,10,10,10);
      
      fill(140,38,20);
      textSize(45);
      text("Continue",400,285);
      text("Retry",440,410);
      text("Quit",450,535);
      
      textSize(35);
      text("Pause",450,195);
      
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 235 && cursor.getY() < 305){
        if(contX>372){
          contX--;
          contX2+=2;
        }
        if(mousePressed){
          HCPause = false;
          menu.menuClicked();
          menu.setMode(-101);
          contX=380;
          contX2=240;
        }
      }else{
        if(contX<380){
          contX++;
          contX2-=2;
        }
      }
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 360 && cursor.getY() < 430){
        if(retryX>372){
          retryX--;
          retryX2+=2;
        }
        if(mousePressed){
          HCPause = false;
          pause = false;
          update = 1;
          HC = new HarumachiClover(75,0,1.01,0.4);
          menu.setMode(3);
          clear();
          menu.songClicked();
          harumachiClover.rewind();
          harumachiClover.play();
          retryX=380;
          retryX2=240;
        }
      }else{
        if(retryX<380){
          retryX++;
          retryX2-=2;
        }
      }
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 485 && cursor.getY() < 555){
        if(quitX>372){
          quitX--;
          quitX2+=2;
        }
        if(mousePressed){
          HCPause = false;
          update = 1;
          pause = false;
          clear();
          harumachiClover.rewind();
          menu.returnClicked();
          menu.setMode(1);
          quitX=380;
          quitX2=240;
          hardMode=false;
        }
      }else{
        if(quitX<380){
          quitX++;
          quitX2-=2;
        }
      }
    }
  }
  else if(menu.getMode() == 4){
    background(YomiYoriBG);
    
    stroke(255);
    strokeWeight(3);
    noFill();
    rect(75,75,850,650); 
    YY.draw();
    if(!yomiYori.isPlaying() && !pause){
      menu.setMode(-2);
    }
    if(pause){
      YYPause = true;
      update = 0;
      background(YomiYoriPause);
      stroke(250);
      strokeWeight(3);
      noFill();
      rect(75,75,850,650);
      yomiYori.pause();
      
      stroke(0,255,255,100);
      strokeWeight(10);
      fill(255);
      rect(350,200,300,400,10,10,10,10);
      
      stroke(140,38,20);
      strokeWeight(5);
      fill(0,255,255);
      rect(cont3X,235,cont3X2,70,10,10,10,10);
      rect(retry3X,360,retry3X2,70,10,10,10,10);
      rect(quit3X,485,quit3X2,70,10,10,10,10);
      strokeWeight(4);
      rect(435,160,125,45,10,10,10,10);
      
      fill(140,38,20);
      textSize(45);
      text("Continue",400,285);
      text("Retry",440,410);
      text("Quit",450,535);
      
      textSize(35);
      text("Pause",450,195);
      
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 235 && cursor.getY() < 305){
        if(cont3X>372){
          cont3X--;
          cont3X2+=2;
        }
        if(mousePressed){
          YYPause = false;
          menu.menuClicked();
          menu.setMode(-103);
          cont3X=380;
          cont3X2=240;
        }
      }else{
        if(cont3X<380){
          cont3X++;
          cont3X2-=2;
        }
      }
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 360 && cursor.getY() < 430){
        if(retry3X>372){
          retry3X--;
          retry3X2+=2;
        }
        if(mousePressed){
          YYPause = false;
          pause = false;
          update = 1;
          YY = new YomiYori(75,0,0.65,0.35);
          menu.setMode(4);
          clear();
          menu.songClicked();
          yomiYori.rewind();
          yomiYori.play();
          retry3X=380;
          retry3X2=240;
        }
      }else{
        if(retry3X<380){
          retry3X++;
          retry3X2-=2;
        }
      }
      if(cursor.getX()>380 && cursor.getX() < 620 && cursor.getY() > 485 && cursor.getY() < 555){
        if(quit3X>372){
          quit3X--;
          quit3X2+=2;
        }
        if(mousePressed){
          YYPause = false;
          update = 1;
          pause = false;
          clear();
          yomiYori.rewind();
          menu.returnClicked();
          menu.setMode(1);
          quit3X=380;
          quit3X2=240;
          hardMode=false;
        }
      }else{
        if(quit3X<380){
          quit3X++;
          quit3X2-=2;
        }
      }
    }
  }
  
  cursor.draw();
  cursor.update();

}

void keyPressed(){
  if(key == ESC && !pause){
    key = 0;
    pause = true;
  }else if(key == ESC && pause){
    key = 0;
    if(IMRPause){
      pause = false;
      IMRPause = false;    
      update = 1; 
      inMyRoom.play(); 
      menu.setMode(2);
      contX=380;
      contX2=240;
    }else if(HCPause){
      pause = false;
      HCPause = false;
      update = 1;
      harumachiClover.play();
      menu.setMode(3);
      cont2X=380;
      cont2X2=240;
    }else if(YYPause){
      pause = false;
      YYPause = false;
      update = 1;
      yomiYori.play();
      menu.setMode(4);
      cont3X=380;
      cont3X2=240;
    }
  }
}

void mouseReleased(){
  if(menu.getMode() == -101 && pause){
    update = 1;
    harumachiClover.play();
    pause = false;
    menu.setMode(3);
  }else if(menu.getMode() == -102 && pause){
    update = 1;
    inMyRoom.play();
    pause = false;
    menu.setMode(2);    
  }else if(menu.getMode() == -103 && pause){
    update = 1;
    yomiYori.play();
    pause = false;
    menu.setMode(4);    
  }else if(menu.getMode() == -100){
    menu.setMode(1);
  }
  
}
