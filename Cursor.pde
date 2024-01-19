class Cursor{
 int x, y;
 int size = 30;
 int size2 = 20;
 int[] trailX = new int[9];
 int[] trailY = new int[9];
 
 void setup(){
  for(int i = 0;i<trailX.length;i++){
    trailX[i] = 0;  
    trailY[i] = 0;  
  }
  
 }
 
 void update(){
   x = mouseX;
   y = mouseY;
 } 
 
 int getX(){
   return x;
 }
 
 int getY(){
   return y;
 }
 
 void draw(){
   for(int i =0; i<trailX.length-1;i++){
     trailX[i] = trailX[i+1]; 
     trailY[i] = trailY[i+1]; 
     
     noStroke();
     fill(0,180,180,200);
     ellipse(trailX[i],trailY[i],28,28);
   }
   
   trailX[trailX.length-1] = x;
   trailY[trailY.length-1] = y;
   
   noCursor();
   noStroke();
   
   fill(0,255,255);
   ellipse(x,y,size,size);
   
   fill(100,255,255);
   ellipse(x,y,25,25);
   
   fill(225,255,255);
   ellipse(x,y,size2,size2);
   
   if(mousePressed){
     if(size<35){
       size++;
       size2++;
     }
   }
   else{
     if(size>30){
       size--;
       size2--;
     }
   }
       
 }
  
} 
