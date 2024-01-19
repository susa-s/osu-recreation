class InMyRoom{
  
  float radius, timer, noteDist, startTime;
  
  float rndX = random(150, 850);
  float rndY = random(150, 650);
  
  public InMyRoom(float radius, float timer, float noteDist, float startTime){
    this.radius = radius;
    this.timer = timer;
    this.noteDist = noteDist;
    this.startTime = startTime;
    
    threeHundred = 0;
    oneHundred = 0;
    fifty = 0;
    misses = 0;
    totalNotes = 0;
    
    accuracy = 100.00;
    combo = 0;
    highestCombo = 0;
    
    circles = new ArrayList<Circle>();
    dead = new ArrayList<Circle>();
    
    if(!hardMode){      
      x = new float[49];
      y = new float[49];
      
      for(int i = 0; i < x.length;i++){
        x[i] = 0;
        y[i] = 0;
      }
      
      x[0] = rndX;
      y[0] = rndY;
      
      int offset = 0;
      for(int i = 1 - offset; i - offset < x.length; i++){
        setRndX();
        setRndY();
        if(dist(rndX,rndY,x[i-offset-1],y[i-offset-1])>75){
          x[i-offset] = rndX;
          y[i-offset] = rndY;
        }else{
          offset++;
        }
      }
      
      int noteNum = 1;
      int colorCheck = 2;
      int red = 30;
      int green = 180;
      int blue = 160;
      for(int i = 0; i < x.length; i++){
        if(noteNum == 5){
          noteNum = 1;
          if(colorCheck == 1){
            red = 30;
            green = 180;
            blue = 160;
            colorCheck++;
          }else if(colorCheck == 2){
            red = 30;
            green = 160;
            blue = 180;
            colorCheck++;
          }else if(colorCheck == 3){
            red = 80;
            green = 80;
            blue = 80;
            colorCheck = 1;
          }
        }
        Circle circle = new Circle(x[i],y[i],radius,noteNum,startTime,red,green,blue);
        circles.add(circle);
        noteNum++;
        startTime += noteDist;
      }
    }else{
      x = new float[61];
      y = new float[61];
      
      for(int i = 0; i < x.length;i++){
        x[i] = 0;
        y[i] = 0;
      }
      
      x[0] = rndX;
      y[0] = rndY;
      
      int offset = 0;
      for(int i = 1 - offset; i - offset < x.length; i++){
        setRndX();
        setRndY();
        if(i-offset==2||i-offset==3||i-offset==4||i-offset==7||i-offset==8||i-offset==9||i-offset==12||i-offset==13||i-offset==14
         ||i-offset==17||i-offset==18||i-offset==19||i-offset==22||i-offset==23||i-offset==24||i-offset==27||i-offset==28||i-offset==29
         ||i-offset==32||i-offset==33||i-offset==34||i-offset==37||i-offset==38||i-offset==39||i-offset==42||i-offset==43||i-offset==44
         ||i-offset==47||i-offset==48||i-offset==49||i-offset==52||i-offset==53||i-offset==54||i-offset==57||i-offset==58||i-offset==59){
          if(dist(rndX,rndY,x[i-offset-1],y[i-offset-1])>75 && dist(rndX,rndY,x[i-offset-1],y[i-offset-1])<300 && dist(rndX,rndY,x[i-offset-2],y[i-offset-2])>75){
            x[i-offset] = rndX;
            y[i-offset] = rndY;
          }else{
            offset++;
          } 
        }else{
          if(dist(rndX,rndY,x[i-offset-1],y[i-offset-1])>75){
            x[i-offset] = rndX;
            y[i-offset] = rndY;            
          }else{
            offset++;
          }
        }
      }
      
      int noteNum = 1;
      int colorCheck = 2;
      int red = 30;
      int green = 180;
      int blue = 160;
      for(int i = 0; i < x.length; i++){
        if(noteNum == 6){
          noteNum = 1;
          if(colorCheck == 1){
            red = 30;
            green = 180;
            blue = 160;
            colorCheck++;
          }else if(colorCheck == 2){
            red = 30;
            green = 160;
            blue = 180;
            colorCheck++;
          }else if(colorCheck == 3){
            red = 80;
            green = 80;
            blue = 80;
            colorCheck = 1;
          }
        }
        Circle circle = new Circle(x[i],y[i],radius,noteNum,startTime,red,green,blue);
        circles.add(circle);
        noteNum++;
        if(i==2||i==3||i==7||i==8||i==12||i==13||i==17||i==18||i==22||i==23||i==27||i==28||i==32||i==33||i==37||i==38||i==42||i==43
           ||i==47||i==48||i==52||i==53||i==57||i==58){
          startTime += noteDist/2;
        }else{
          startTime += noteDist;
        }
      }
    }
  }
 
  void draw(){
    if(!pause){
      timer+=0.01;
    }
    for(Circle show : circles){
      if(timer > show.getStartTime()){
        show.draw();
        if((show.isDead() || show.isClicked()) && !dead.contains(show)){
          countScore(show);
          dead.add(show);
        } 
      }
    }
    fill(255);
    textSize(30);
    text(String.format("%.2f",accuracy)+"%", 850,50);
    
    textSize(30);
    text(combo+"x",45,765);
  }
  
  void setAcc(){
    accuracy = 100*((fifty*16.67 + oneHundred*33.33 + threeHundred*100)/(totalNotes*100));
  }
  
  void countScore(Circle score){
    if(score.getScore() == 300){
      threeHundred++;
      totalNotes++;
      setAcc();
    }
    else if(score.getScore() == 100){
      oneHundred++;
      totalNotes++;
      setAcc();
    }
    else if(score.getScore() == 50){
      fifty++;
      totalNotes++;
      setAcc();
    }
    else if(score.getScore() == 0){
      misses++;
      totalNotes++;
      setAcc();
    }
    if(score.getScore()>=100){
      combo++;
      if(combo > highestCombo){
        highestCombo = combo;
      }
    }else{
      combo = 0;
    }
  }
  
  void setRndX(){
    rndX = random(150, 850);
  }
  
  void setRndY(){
    rndY = random(150, 650);
  }
  
}
