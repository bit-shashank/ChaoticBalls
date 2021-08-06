class Circle{
  float timeToDead;
  float timeLived;
  float radius;
  color col;
  public Circle(float radius,color col){
    this.radius=radius;
    this.timeToDead=255;
    this.timeLived=0;
    this.col=col;
  }
  
  void show(){
    stroke(col,255-timeLived);
    strokeWeight(1);
    noFill();
    circle(width/2,height/2,2*radius);
  }
  
  void update(){
    this.radius+=2;
    this.timeLived+=4;
  }
}
