void win() {

  background(0, 255, 0);
fill(0);
textSize(50);
  text("YOU WIN!!",400,400);
  textSize(30);
  text("CLICK ANYWHERE TO PLAY AGAIN", 400,500);
}

void winClicks() {
  if (dist(mouseX, mouseY, 0, 0) <800) {
    myObjects.clear();
    setup();
    mode=INTRO;
  }
}
