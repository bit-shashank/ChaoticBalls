class Ball{
   PVector pos;
   PVector vel;
   float radius;
   color col;
   float gravity=0.15;
   int trailLength=200;
   ArrayList<PVector> trail;
   public Ball(float x,float y, int radius,color c){
      this.pos=new PVector(x,y);
      this.vel=new PVector(0,0);
      this.radius=radius;
      this.col=c;
      trail=new ArrayList();
   }
   
   void show(){
     fill(col);
     noStroke();
     circle(pos.x,pos.y,2*radius);
     //Show Trail
     
     fill(col,80);
     for(PVector point:trail){
        ellipse(point.x,point.y,4,4);
     }
   }
   
   void collision(){
     //calculate distace between centres of ball and bigger circle
     PVector dis=PVector.sub(this.pos,new PVector(width/2,height/2));

     if(dis.mag()>=container_radius-radius){
       //Collisons
       //Finding the normal vector
       PVector disNorm=dis.normalize();
       //Fixing the position first
       pos.add(disNorm.mult(-1));
       //Finding the projection vector of velocity vector on disNorm vector
       float mag= vel.dot(disNorm);
       PVector projVec=disNorm.mult(mag);
       //New Velocity = OldVelocity-2*projVec;
       PVector newVel=vel.add(projVec.mult(-2));
       this.vel=newVel;
       
       wave.add(new Circle(container_radius,col));
       file.play();
       return;
     }
     PVector force=new PVector(0,gravity);
     vel.add(force);
     
   }
   void update(){
     collision();
     pos.add(vel);
     if (trail.size()<trailLength){
       trail.add(new PVector(pos.x,pos.y));
     }
     else{
       trail.remove(0);
       trail.add(new PVector(pos.x,pos.y));
     }
   }
}
