class UFO extends GameObject {

  float ShotTimer;
  UFO() {


    int i= (int)random(0, 4);
    fill(255, 0, 0);
    if (i==0) {
      loc=new PVector (random(50, 800), 50);
      vel=new PVector (0, random(1, 3));
    } else if (i==1) {
      loc=new PVector (50, random(50, 600));
      vel=new PVector (random(1, 3), 0);
    } else if (i==2) {
      loc=new PVector (random(50, 800), 600);
      vel= new PVector (0, random(-1, -3));
    } else if (i==3) {
      loc=new PVector (width, random(50, 600));
      vel = new PVector (random(-1, -3), 0);
    }

    lives=1;
    size=70;
    ShotTimer=200;
  }

  void show() {
    fill(255, 0, 0);
    circle(loc.x, loc.y, 50);
  }

  void act() {
    loc.add(vel);
    if (loc.x<=0 || loc.x>=800 || loc.y<=0 || loc.y>=600) {
      lives=0;
    }

    if (ShotTimer <=0) {
      myObjects.add(new UFOBullets(loc));
      ShotTimer=100;
    }
    ShotTimer--;
  }
}
