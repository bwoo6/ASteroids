void pause() {
  fill(255);
  textFont(striped);
  textSize(120);
  text("PAUSE", width/2, height/2);
  textSize(20);
  text("CLICK ANYWHERE TO RESUME", width/2, height/3);
}

void pauseClicks() {
  if (dist(mouseX, mouseY, 0, 0) <800) {
    mode=GAME;
  }
}
