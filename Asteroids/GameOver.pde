void gameover() {
  background(255, 0, 0);
  fill(0);
  textSize(50);
  text("YOU LOST!!", 400, 400);
  textSize(30);
  text("CLICK ANYWHERE TO PLAY AGAIN", 400, 500);
}

void gameoverClicks() {
  if (dist(mouseX, mouseY, 0, 0) <800) {
    myObjects.clear();
    setup();
    mode=INTRO;
  }
}
