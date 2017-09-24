void setup() {
  size(500, 500);
  background(0);
}

void draw() {
 stroke(255);
 fill(255);
 //line(pmouseX, pmouseY, mouseX, mouseY);
 //ellipse(mouseX, mouseY, 100, 100); // draw circle on current mouseX, mouseY
 //println(mouseX + " " + mouseY); // return current pos of mouseX, mouseY in console
 //println(frameCount); // counts frames
 if (frameCount % 60 == 0) {
   background(random(0, 255), random(0, 255), random(0, 255)); // random (float, float); 
 }
}