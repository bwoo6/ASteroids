class Asteroid extends GameObject {

  Asteroid() {
    lives=1;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI));
    size=100;
  }

  Asteroid(int s, float x, float y) {
    lives=1;
    loc = new PVector (x, y);
    vel = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI));
    size=s;
  }

  void show() {
    fill(100);
    stroke(255);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();
    if (size<=20) {
      lives=0;
    }

    int i=0;

    while (i<myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size) {
          myObj.lives=0;
          lives=0;
          myObjects.add(new Asteroid(size/2, loc.x, loc.y));
          myObjects.add(new Asteroid(size/2, loc.x, loc.y));
          myObjects.add(new Explode(loc));
          myObjects.add(new Explode(loc));
          myObjects.add(new Explode(loc));
          score++;
        }
      }
      i++;
    }
  }
}
