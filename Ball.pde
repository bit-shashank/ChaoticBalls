class Ball{
   PVector pos;
   PVector vel;
   float radius;
   color col;
   float gravity=0.1;
   
   public Ball(int x,int y, int radius,color c){
      this.pos=new PVector(x,y);
      this.vel=new PVector(0,0);
      this.radius=radius;
      this.col=c;
   }
   
   void show(){
     fill(col);
     noStroke();
     circle(pos.x,pos.y,radius);
   }
}
