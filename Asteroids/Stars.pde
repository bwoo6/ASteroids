class Stars {
 float x,y;
 
 Stars() {
  x=random(width);
  y=random(height);
 }

 void act () {
 rotate(radians(3)); 
 }
 
 void show() {
   noStroke();
   fill(255);
   ellipse(x,y,random(1,10), random(1,10));
 }
}
