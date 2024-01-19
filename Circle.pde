class Circle{
 float x, y, radius, score, startTime, scoreDisappear;
 int noteNum, red, green, blue;
 boolean dead, clicked;
 ApproachCircle ac;
 
 public Circle(float x, float y, float radius, int noteNum, float startTime, int red, int green, int blue){
  this.x=x;
  this.y=y;
  this.radius = radius;
  this.noteNum = noteNum;
  this.startTime = startTime;
  this.red = red;
  this.green = green;
  this.blue = blue;
  
  scoreDisappear = 100;
  score=2.5;
  dead = false;
  clicked = false;
  
  ac = new ApproachCircle(x,y,2.5*radius, red, green, blue);
  
 }
 
 void displayScore(float scoreX, float scoreY){
  String displayText = "";
  if(getScore()==300){
    fill(0, 255, 255);
    displayText = "300";
  }else if(getScore()==100){
    fill(15, 216, 149);
    displayText = "100";
  }else if(getScore()==50){
    fill(0,200,200);
    displayText = "50";
  }else{
    fill(255,0,0);
    displayText = "x";
  }
  textSize(15);
  text(displayText, scoreX+5, scoreY+5);
  scoreDisappear -= 2;
 }
 
 void draw(){
   if(!isDead()){
     if(ac.getRadius() >= radius-20){
      ac.draw();
     }
     else{
      dead = true; 
     }
     stroke(255,255,255);
     strokeWeight(2);
     fill(red,green,blue);
     ellipse(x,y,radius-4,radius-4);
     fill(255,255,255);
     textSize(40);
     text(noteNum, x-12, y+13);
   }else{
     if(scoreDisappear > 0){
       displayScore(x,y);
     }
   }
 }
 
 void mouseClicked(){
   playHitSound.play();
   playHitSound = hitSounds.loadFile("sounds/hitsound.mp3");
 }
 
 boolean isClicked(){
  return clicked; 
 }
 
 boolean isDead(){
   if(!dead && !pause){
     clicked = (dist(mouseX, mouseY, this.x, this.y) < radius/2 && mousePressed);
     if(clicked){
       score = ac.getRadius() / radius; 
       mouseClicked();
     }
     dead = clicked;
   }
   return dead;
 }
 
 float getStartTime(){
   return startTime;  
 }
 
 int getScore(){
   if(score < 1.15 && score > 0.85) {
     return 300;
   }else if(score < 1.45 && score > 0.55){
     return 100;  
   }else if(score < 1.75) {
     return 50;
   }else{
     return 0; 
   }
 }
 
 int getRed(){
   return red;
 }
 
 int getGreen(){
   return green;
 }
 
 int getBlue(){
   return blue;
 }
 
 float getX(){
   return x;  
 }
 
 float getY(){
   return y;  
 }
 
}
