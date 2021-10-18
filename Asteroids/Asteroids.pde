boolean upkey, downkey, leftkey, rightkey, spacekey, pause, teleport;
Ship myShip;
UFO myUFO;
PImage[] gif;
int numberOfFrames;

Stars[] stars;
int numStars=150;

int f,g;

ArrayList<GameObject> myObjects;
PFont striped;
final int GAME = 0;
final int INTRO = 1;
final int GAMEOVER = 2;
final int WIN = 3;
final int PAUSE =4;
int mode, x, y;
int score;


void setup() {
  size(800, 600);
  //Stars
  stars= new Stars[numStars];
  int i=0;
  while (i<numStars) {
    stars[i] = new Stars();
    i++;
  }

  x=25;
  y=35;
  imageMode(CENTER);
  myShip= new Ship();
  myObjects=new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  mode=INTRO;
  striped=createFont("Striped Campus.ttf", 200);
  score=0;

  //gifs
  numberOfFrames =31;
  gif = new PImage[numberOfFrames];
  int g =0;
  while (g<numberOfFrames ) {
    gif[g]=loadImage("frame_"+g+"_delay-0.01s.gif");
    g=g+1;
  }
}

void draw() {
  background(0);
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode==WIN) {
    win();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println("Error: Mode = " + mode);
  }
}
