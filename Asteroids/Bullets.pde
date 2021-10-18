class Bullet extends GameObject {

  int timer;
  Bullet() {
    timer=120;
    lives=1;
    loc=new PVector(myShip.loc.x, myShip.loc.y);
    vel=new PVector(myShip.dir.x, myShip.dir.y);
    vel.setMag(15);
    size = 5;
  }

  void show() {
    stroke(255);
    fill(255,0,0);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    loc.add(vel);
    if (loc.y<-50) loc.y=height+300;
    if (loc.y>height+50) loc.y=-300;
    if (loc.x<-50) loc.x=width+300;
    if (loc.x>width+50) loc.x=-300;

    timer--;
    if (timer<=0) {
      lives=0;
    }
  }
}
