class Fire extends GameObject {

  int t; //Transparency
  PVector nudge;

  Fire() {
    lives=1;
    size=int(random(5,12));
    t=int(random(200,255));
    loc=new PVector (myShip.loc.x, myShip.loc.y);
    loc=myShip.loc.copy();
    nudge=myShip.dir.copy();
    nudge.rotate(PI);
    nudge.setMag(12);
    loc.add(nudge);
    vel=myShip.dir.copy();
    vel.rotate(PI+random(-0.5,1));
    vel.setMag(3);
  }

  void show() {
    noStroke();
    fill(255,0,0,t);
    circle(loc.x,loc.y,size);
  }

  void act() {
    super.act();
    t=t-10;
    if (t<=0) lives=0;
  }
}
