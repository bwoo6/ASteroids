class Explode extends GameObject {
  int t; //Transparency
  PVector nudge;

  Explode(PVector l) {
    lives=1;
    size=int(random(4, 10));
    t=int(random(200, 255));
    vel=new PVector(-10, 10);
    vel.rotate(random(-0.5, 0.5));
    loc=l.copy();
    vel.setMag(random(1, 5));
  }

  void show() {
    noStroke();
    fill(0, 250, 255, t);
    circle(loc.x, loc.y, size);
    circle(loc.x+20, loc.y+10, size);
    circle(loc.x+10, loc.y-5, size);
    circle(loc.x-10, loc.y+5, size);
    circle(loc.x-20, loc.y-10, size);
  }

  void act() {
    super.act();
    t=t-4;
    if (t<=0) lives=0;
  }
}
