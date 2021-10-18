void intro() {
  //Moving Code
  x=x+3;
  if (x>=850) {
    x=-50;
  }



  fill(255);

  
  //Other
  textSize(100);
  text("ASTEROIDS", width/2, height/4);



  //Spaceship
  pushMatrix();
  fill(255);
  stroke(255);
  triangle(x, y, x, y+30, x+50, y+15);
  fill(0);
  stroke(100);
  rect(x+5, y+5, 10, 5);
  rect(x+5, y+20, 10, 5);
  popMatrix();

  //Start Button
  textFont(striped);
  fill(255);
  rect(250, 225, 300, 150);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("START", width/2, height/2);

  //Stars
  int i = 0;
  while (i < numStars) {
    stars[i].act();
    stars[i].show();
    i++;
  }
}

void introClicks() {
  if (mouseX > 250 && mouseX < 550 && mouseY > 225 && mouseY < 375) {
    mode=GAME;
  }
}
