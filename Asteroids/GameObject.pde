class GameObject {
  int lives;
  PVector loc; //Location
  PVector vel; //Velocity
  int size;

  GameObject() {
  }

  void show() {
  }

  void act() {
    loc.add(vel);

    if (loc.y<-50) loc.y=height+50;
    if (loc.y>height+50) loc.y=-50;
    if (loc.x<-50) loc.x=width+50;
    if (loc.x>width+50) loc.x=-50;
  }
}
