Ball ball;
void setup(){
  size(640,640);
  ball=new Ball(width/2,height/2,20);
}

void draw(){
  background(0);
  strokeWeight(3);
  stroke(255);
  noFill();
  ellipse(width/2,height/2,550,550);
}
