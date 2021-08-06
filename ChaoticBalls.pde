import processing.sound.*;


SoundFile file;
int pallete[]={#FF6702,#0DDFFF};
boolean pause=true;
float container_radius=500/2;
ArrayList<Ball> balls=new ArrayList<Ball>();
ArrayList<Circle> wave=new ArrayList<Circle>();


void setup(){
  size(670,670);
  //balls.add(new Ball(width/2+0.5,height/2,10,color(#FF6702)));
  //balls.add(new Ball(width/2+0.5001,height/2,10,color(#0DDFFF)));
  float offset=10;
  float delta=0.0005;
  for(int i=0;i<5;i++){
    offset+=delta;
    balls.add(new Ball(width/2+offset,height/2-200,10,color(pallete[i%pallete.length])));
  }
  file=new SoundFile(this, "tick.mp3");
}

void draw(){
  if(!pause){
    background(0);
    strokeWeight(3);
    stroke(255);
    noFill();
    circle(width/2,height/2,container_radius*2);
    for(Ball ball:balls){
      ball.update();
      ball.show();
    }
    
    //Update Wave
    ArrayList<Circle> toDelete=new ArrayList<Circle>();
    for(Circle c:wave){
      c.show();
      c.update();
      if(c.timeLived>c.timeToDead){
        toDelete.add(c);
      }
    }
    wave.removeAll(toDelete);
  }
}

void keyPressed(){
  pause=!pause;
}
