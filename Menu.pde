class Menu{
  int x, y;
  int mode;
  
  int r = 450;
  int rectX = 550;
  int rectY = 150; 
  int rectX2 = 550;
  int rectY2 = 250;
  int rectX3 = 550;
  int rectY3 = 600;
  int rectX4 = -100;
  int rectY4 = 200;
  int rectX5 = -100;
  int rectY5 = 300;
  int x2 = 185;
  int y2 = 50;
  int textSize = 180;
  int textSize2 = 35;
  int alpha = 100;
  int alpha2 = 200;
  int alpha3 = 50;
  int alpha4 = 50;
  int alpha5 = 100;
  int alpha6 = 100;
  int alpha7 = 100;
  int alpha8 = 100;
  int alpha9 = 100;
  
  boolean exit = false;
  
  PImage menu;
  PImage songSelect;
  
  public Menu(int x, int y){
    this.x = x;
    this.y = y;
    mode = 0;
    
    menu = loadImage("backgrounds/mainmenu.jpg");
    songSelect = loadImage("backgrounds/songselect.jpg");
   
  }
  
  void draw(){
    if(mode == 0){
      background(menu);
      stroke(255);
      strokeWeight(20);
      fill(230,0,124);
      ellipse(x/2,y/2,r,r);
      
      fill(255);
      textSize(textSize);
      text("osu!", x/2-x2,y/2+y2);
      
      fill(200,100,100,alpha6);
      stroke(255);
      strokeWeight(5);
      rect(425,725,150,50,10,10,10,10);
      
      fill(255);
      textSize(50);
      text("Exit",453,769);
      
      if(cursor.getX() > 400 && cursor.getX() < 600 && cursor.getY() > 715 && cursor.getY() < 780){
        if(alpha6<200){
          alpha6+=5;
        }
        if(mousePressed){
          exit = true;
        }       
      }else{
        if(alpha6>100){
          alpha6-=5;
        }
      }   
      
      if(dist(cursor.getX(),cursor.getY(),500,400)<=250){
        if(r<=575){
          r+=5;
          textSize+=1;
          x2+=1;
        }
        if(mousePressed){
          mode = -100;
          clear();
          menuClicked();
          r=450;
          textSize=180;
          x2=185;
        }
      }else{
        if(r>=455){
          r-=5;
          textSize-=1;
          x2-=1;
        }  
      } 
    }
    if(mode == 1){
      background(songSelect);
    
      noStroke();
      fill(150,220,230,150);
      rect(400,0,1000,50);
      rect(0,0,400,100);
      triangle(400,50,400,100,450,50);
      stroke(255);
      line(0,100,400,100);
      line(400,100,450,50);
      line(450,50,1000,50);
      
      stroke(0,140,140);
      strokeWeight(10);
      fill(200,230,230,200);
      rect(-5,740,1010,105);  
      rect(-5,115,425,325,0,20,20,0);
      rect(480,65,600,325,20,0,0,20);
      rect(-5,475,375,175,0,20,20,0);
      
      fill(75,75,75);
      textSize(35);
      text("How To Play",50,525);
      textSize(25);
      text("Click the circles to the beat",20,575);
      text("Press esc to pause",20,625);
      fill(255);
      textSize(50);
      text("Song Select",65,65);
      
      fill(0,140,140,alpha2);
      stroke(255);
      strokeWeight(5);
      rect(-5,690,225,75, 0 , 8, 8, 0);
      fill(255);
      textSize(textSize2);
      text("Return",40,740);
      if(cursor.getX()>0 && cursor.getX()<220 && cursor.getY()>690 && cursor.getY()<765){
        if(alpha2<=250){
          alpha2+=2;
        }
        if(mousePressed){
          mode = 0;
          clear();
          returnClicked();
          alpha2=200;
        }
      }else{
        if(alpha2>200){
          alpha2-=2;
        }  
      } 
      
      stroke(0,255,255);
      strokeWeight(5);
      fill(0,140,140,alpha);
      rect(rectX,rectY,550,80,15,0,0,15);
      fill(255);
      textSize(35);
      text("Normal Difficulty",690,115);
      textSize(25);
      text("FELT - In My Room", rectX+15, rectY+35);
      
      if(cursor.getX()>550 && cursor.getY()>150 && cursor.getY()<250){
        if(rectX>500){
          rectX-=2;
          alpha+=2;
        }
        if(mousePressed){
          IMR = new InMyRoom(75 , 0, 0.87, 0.41);  
          mode = 2;
          clear();
          songClicked(); 
          inMyRoom.rewind();
          inMyRoom.play();
          rectX=550;
          alpha=100;
        }
      }else{
        if(rectX<=549){
          rectX+=2;
          alpha-=2;
        }
      }
      
      stroke(0,255,255);
      strokeWeight(5);
      fill(0,140,140,alpha8);
      rect(rectX4,rectY4,450,80,0,15,15,0);
      fill(255);
      textSize(35);
      text("Hard Difficulty",25,165);
      textSize(25);
      text("FELT - In My Room", rectX4+205, rectY4+35);
      
      if(cursor.getX()<350 && cursor.getY()>200 && cursor.getY()<300){
        if(rectX4<-50){
          rectX4+=2;
          alpha8+=2;
        }
        if(mousePressed){
          hardMode = true;
          IMR = new InMyRoom(75,0,0.87,0.4);  
          mode = 2;
          clear();
          songClicked(); 
          inMyRoom.rewind();
          inMyRoom.play();
          rectX4=-100;
          alpha8=100;
        }
      }else{
        if(rectX4>-100){
          rectX4-=2;
          alpha8-=2;
        }
      } 
      
      stroke(0,255,255);
      strokeWeight(5);
      fill(0,140,140,alpha9);
      rect(rectX5,rectY5,450,80,0,15,15,0);
      fill(255);
      textSize(25);
      text("Hanasaka Yui -", rectX5+200, rectY5+35);
      text("Harumachi Clover",rectX5+220,rectY5+65);
      
      if(cursor.getX()<350 && cursor.getY()>300 && cursor.getY()<400){
        if(rectX5<-50){
          rectX5+=2;
          alpha9+=2;
        }
        if(mousePressed){
          hardMode = true;
          HC = new HarumachiClover(75 , 0, 1.01, 0.41);  
          mode = 3;
          clear();
          songClicked(); 
          harumachiClover.rewind();
          harumachiClover.play();
          rectX5=-100;
          alpha9=100;
        }
      }else{
        if(rectX5>-100){
          rectX5-=2;
          alpha9-=2;
        }
      } 
      
      stroke(0,255,255);
      strokeWeight(5);
      fill(0,140,140,alpha5);
      rect(rectX2,rectY2,550,80,15,0,0,15);
      fill(255);
      textSize(25);
      text("Hanasaka Yui - Harumachi Clover", rectX2+15, rectY2+35);
      
      if(cursor.getX()>550 && cursor.getY()>250 && cursor.getY()<350){
        if(rectX2>500){
          rectX2-=2;
          alpha5+=2;
        }
        if(mousePressed){
          HC = new HarumachiClover(75 , 0, 1.01, 0.4);
          clear();
          songClicked();
          harumachiClover.rewind();
          harumachiClover.play();
          rectX2=550;
          mode = 3;
          alpha5=100;
        }
      }else{
        if(rectX2<=549){
          rectX2+=2;
          alpha5-=2;
        }
      }
      /*
      stroke(0,255,255);
      strokeWeight(5);
      fill(0,140,140,alpha7);
      rect(rectX3,rectY3,800,80,15,0,0,15);
      fill(255);
      textSize(20);
      text("Imperial Circus Dead Decadence - Yomi Yori", rectX3+10, rectY3+35);
      text("Kikoyu, Koukoku no Tou to Honoo no Shoujo", rectX3+10, rectY3+60);
      textSize(30);
      fill(255,0,0);
      text("Still Under Development",575,575);
      
      if(cursor.getX()>550 && cursor.getY()>600 && cursor.getY()<700){
        if(rectX3>500){
          rectX3-=2;
          alpha7+=2;
        }
        if(mousePressed){
          YY = new YomiYori(75 , 0, .65, 0.35);
          clear();
          songClicked();
          yomiYori.rewind();
          yomiYori.play();
          rectX3=550;
          mode = 4;
          alpha7=100;
        }
      }else{
        if(rectX3<=549){
          rectX3+=2;
          alpha7-=2;
        }
      }
      */
    }
    if(mode == -1){
      endSong.play();
      background(InMyRoomBG);
      
      stroke(255);
      strokeWeight(5);
      fill(0,140,140,alpha3);
      rect(700,600,250,75, 8,8,8,8);
      fill(0,10,25,200);
      rect(-5,-5,1010,77);
      strokeWeight(7);
      fill(0,140,140,100);
      rect(-20,75,535,550,20,20,20,20);
      
      noFill();
      stroke(25,25,25,100);
      strokeWeight(3);
      rect(30,115,400,75,10,10,10,10);
      rect(30,215,400,75,10,10,10,10);
      rect(30,315,400,75,10,10,10,10);
      rect(30,415,400,75,10,10,10,10);
      
      fill(255);
      textSize(45);
      if(hardMode){
        text("Felt - In My Room -- Hard", 40, 50);
      }else{
        text("Felt - In My Room", 40, 50);
      }
      
      textSize(50);    
      fill(0, 255, 255);
      text("300",50,170);
      text(String.format("%11dx",threeHundred),165,170);
      
      fill(15, 216, 149);
      text("100",50,270);
      text(String.format("%11dx",oneHundred),165,270);
      
      fill(0,200,200);
      text("50",80,370);
      text(String.format("%11dx",fifty),165,370);
      
      fill(200,0,0);
      text("Miss",35, 470);
      text(String.format("%11dx",misses),165,470);
      
      textSize(30);
      fill(255);
      text("Combo               Accuracy",35,535);      
      
      textSize(50);
      fill(230,230,230);
      text(+highestCombo+"x",55,590);
      
      if(highestCombo == 49 || highestCombo == 61){
        stroke(255);
        strokeWeight(5);
        fill(0,140,140,100);
        rect(315,625,175,50,0,0,8,8);
        fill(255);
        textSize(25);
        text("FULL COMBO",325,657);
        
      }
      
      textSize(50);
      text(String.format("%.2f",accuracy)+"%",250,590);
      
      fill(0,255,200,175);
      stroke(255);
      strokeWeight(4);
      rect(850,95,125,50,10,10,10,10);
      
      fill(255);
      textSize(25);
      text("Ranking", 864,127);
      
      textSize(400);
      if(accuracy == 100 || accuracy > 90 && highestCombo == 49){
        fill(192,192,192);
        text("S",600,500);
      }else if(accuracy >= 90){
        fill(0,200,50);
        text("A",600,500);
      }else if(accuracy >= 80){
        fill(131,163,248);
        text("B",600,500);        
      }else if(accuracy >= 70){
        fill(258,24,148);
        text("C",600,500);        
      }else{
        fill(248,100,100);
        text("D",600,500);        
      }
      
      fill(255);
      textSize(40);
      text("Retry",770,650);
      
      if(cursor.getX()>700 && cursor.getX()<950 && cursor.getY()>600 && cursor.getY()<675){
        if(alpha3 < 200){
          alpha3+=5;
        }
        if(mousePressed){
          endSong.pause();
          endSong.rewind();
          IMR = new InMyRoom(75,0,0.87,0.4);  
          mode = 2;
          clear();
          songClicked();
          inMyRoom.rewind();
          inMyRoom.play();
          alpha3 = 50;
        }
      }else{
        if(alpha3 > 50){
          alpha3-=5;
        }
      }
      stroke(255);
      strokeWeight(5);
      fill(0,140,140,alpha4);
      rect(-5,675,300,75, 0 , 8, 8, 0);
      
      fill(255);
      textSize(35);
      text("Song Select", 45, 725);
      
      if(cursor.getX()>0 && cursor.getX()<295 && cursor.getY()>675 && cursor.getY()<750){
        if(alpha4 < 200){
          alpha4+=5;
        }
        if(mousePressed){
          endSong.pause();
          endSong.rewind();
          mode = -100;
          clear();
          returnClicked();
          alpha4 = 50;
          hardMode = false;
        }
      }else{
        if(alpha4 > 50){
          alpha4-=5;   
      }
      
    }
  }
  
  if(mode == -2){
    endSong.play();
    background(HarumachiCloverBG);
      
    stroke(255);
    strokeWeight(5);
    fill(0,140,140,alpha3);
    rect(700,600,250,75, 8,8,8,8);
    fill(0,10,25,200);
    rect(-5,-5,1010,77);
    strokeWeight(7);
    fill(0,140,140,100);
    rect(-20,75,535,550,20,20,20,20);
    
    noFill();
    stroke(25,25,25,100);
    strokeWeight(3);
    rect(30,115,400,75,10,10,10,10);
    rect(30,215,400,75,10,10,10,10);
    rect(30,315,400,75,10,10,10,10);
    rect(30,415,400,75,10,10,10,10);
      
    fill(255);
    textSize(45);
    if(hardMode){
      text("Hanasaka Yui - Harumachi Clover -- Hard", 40, 50);
    }else{
      text("Hanasaka Yui - Harumachi Clover", 40, 50);
    }
      textSize(50);    
      fill(0, 255, 255);
      text("300",50,170);
      text(String.format("%11dx",threeHundred),165,170);
      
      fill(15, 216, 149);
      text("100",50,270);
      text(String.format("%11dx",oneHundred),165,270);
      
      fill(0,200,200);
      text("50",80,370);
      text(String.format("%11dx",fifty),165,370);
      
      fill(200,0,0);
      text("Miss",35, 470);
      text(String.format("%11dx",misses),165,470);
      
      textSize(30);
      fill(255);
      text("Combo               Accuracy",35,535);
      
      textSize(50);
      fill(230,230,230);
      text(+highestCombo+"x",55,590);
      
      if(highestCombo == 33 || highestCombo == 52){
        stroke(255);
        strokeWeight(5);
        fill(0,140,140,100);
        rect(315,625,175,50,0,0,8,8);
        fill(255);
        textSize(25);
        text("FULL COMBO",325,657);
        
      }
      
      textSize(50);
      text(String.format("%.2f",accuracy)+"%",250,590);
      
    fill(0,255,200,175);
    stroke(255);
    strokeWeight(4);
    rect(850,95,125,50,10,10,10,10);
      
    fill(255);
    textSize(25);
    text("Ranking", 864,127);
      
    textSize(400);
    if(accuracy == 100 || accuracy > 90 && highestCombo == 33){
      fill(192,192,192);
      text("S",600,500);
    }else if(accuracy >= 90){
      fill(0,200,50);
      text("A",600,500);
    }else if(accuracy >= 80){
      fill(131,163,248);
      text("B",600,500);        
    }else if(accuracy >= 70){
      fill(258,24,148);
      text("C",600,500);        
    }else{
      fill(248,100,100);
      text("D",600,500);        
    }
      
    fill(255);
    textSize(40);
    text("Retry",770,650);
      
    if(cursor.getX()>700 && cursor.getX()<950 && cursor.getY()>600 && cursor.getY()<675){
      if(alpha3 < 200){
        alpha3+=5;
      }
      if(mousePressed){
        endSong.pause();
        endSong.rewind();
        HC = new HarumachiClover(75,0,1.01,0.4);
        mode = 3;
        clear();
        songClicked();
        harumachiClover.rewind();
        harumachiClover.play();
        alpha3 = 50;
      }
    }else{
      if(alpha3 > 50){
        alpha3-=5;
      }
    }
    stroke(255);
    strokeWeight(5);
    fill(0,140,140,alpha4);
    rect(-5,675,300,75, 0 , 8, 8, 0);
      
    fill(255);
    textSize(35);
    text("Song Select", 45, 725);
      
    if(cursor.getX()>0 && cursor.getX()<295 && cursor.getY()>675 && cursor.getY()<750){
      if(alpha4 < 200){
        alpha4+=5;
      }
      if(mousePressed){
        endSong.pause();
        endSong.rewind();
        mode = -100;
        clear();
        returnClicked();
        alpha4 = 50;
        hardMode = false;
      }
    }else{
      if(alpha4 > 50){
        alpha4-=5;   
      }   
    }
  }
    
    if(mode == -100){
      background(0);
    } 
    if(mode == -101){
      background(0);
    }
    if(mode == -102){
      background(0);
    }
    if(mode == -103){
      background(0);
    }
  }
  
  int getMode(){
    return mode;
  }
  
  boolean exit(){
    return exit;
  }
  
  void setMode(int mode){
    this.mode = mode;
  }
  
  void menuClicked(){
    playMenuHit.play();
    playMenuHit = hitSounds.loadFile("sounds/menuhit.wav");
  }
  
  void returnClicked(){
    playReturnHit.play();
    playReturnHit = hitSounds.loadFile("sounds/menuback.wav");
  }
  
  void songClicked(){
    playSongClick.play();
    playSongClick = hitSounds.loadFile("sounds/songclick.wav");
  }
  
  void playInMyRoom(){
    inMyRoom.play();
  } 
  
}
