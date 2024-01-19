class ApproachCircle{
  float x, y, radius;
  int red, blue, green;
  
  public ApproachCircle(float x, float y, float radius, int red, int green, int blue){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
  
  float getRadius(){
    return radius;
  }
  
  void updateRadius(){
    radius -= update;
  }
  
  void draw(){
   fill(0,0,0,0);
   stroke(red,green,blue);
   strokeWeight(4);
   ellipse(x,y,radius,radius);
   updateRadius();
  }
  
}
