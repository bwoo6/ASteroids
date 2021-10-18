void game() {
  background(0);
  fill(255);
  image(gif[f], width,height);
  f=f+1;
  if (f==numberOfFrames) f=0;
  textSize(20);
  text("LIVES:"+myShip.lives, 50, 500);

  
  
  int i = 0;
  while (i< myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives==0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
}

void gameClicks() {
}
