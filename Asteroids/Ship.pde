class Ship extends GameObject {
  PVector dir; //Direction
  int shotTimer, threshold, invincibleTimer, teleportcooldown, ufointerval;
  boolean isInvincible;
  Ship() {
    lives=3;
    loc=new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(0, -0.1);
    shotTimer=0;
    //ReloadSpeed
    threshold=10;
    invincibleTimer=255;
    isInvincible=true;
    teleportcooldown=755;
    ufointerval=300;
  size=50;
  }


  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    if (isInvincible) {
      fill(invincibleTimer, 0, 0);
      stroke (255, 0, 0);
    } else {
      fill(255);
      stroke(255);
    }
    triangle(-25, -15, -25, 15, 25, 0);
    popMatrix();
  }

  void act() {
    super.act();
    if (vel.mag() > 5) {
      vel.setMag(5);
    }


    if (score==42) mode=WIN;

    int i=0;
    while (i<myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Asteroid && !isInvincible) {
        if (dist(myShip.loc.x, myShip.loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size-50) {
          lives=lives-1;
          isInvincible=true;
        }
      }
      i++;
    }

    if (lives==0) {
      mode=GAMEOVER;
    }
    if (isInvincible) {
      invincibleTimer=invincibleTimer-2;
    }

    if (invincibleTimer<=0) {
      invincibleTimer=255;
      isInvincible=false;
    }

    if (ufointerval<=0) {
      myObjects.add(new UFO());
      ufointerval=600;
    }

    ufointerval--;
    shotTimer++;

    if (upkey) {
      vel.add(dir);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (downkey) vel.sub(dir);
    if (leftkey) dir.rotate(radians(-3));
    if (rightkey) dir.rotate(radians(3));
    if (spacekey && shotTimer >= threshold) {
      myObjects.add(new Bullet());
      shotTimer=0;
    }

    if (upkey==false && downkey==false) {
      vel.setMag(vel.mag()*0.95);
    }
    teleportcooldown=teleportcooldown-5;

    if (teleportcooldown<=0) {
      if (teleport==true) {
        loc.x=random(50, 750);
        loc.y=random(50, 550);
        teleport=false;
        isInvincible=true;
        teleportcooldown=755;
      }
    }

    for (int v=0; v<myObjects.size(); v++) {
      GameObject myS= myObjects.get(v);
      if (myS instanceof UFOBullets) {
        println(myShip.size);
        if (dist(myS.loc.x, myS.loc.y, myShip.loc.x, myShip.loc.y) <= size/2 + myShip.size) {
          myShip.lives--;
          myS.lives=0;
          isInvincible=true;
        }
      }
    }
  }
}
