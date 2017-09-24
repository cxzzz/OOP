// dia 100  , color blue, background black, mouse inside circle red. else blue

void setup() {
 size(500, 500);
 halfW = width / 2;
 halfH = height / 2;
 radius = 50;
}

float halfW;
float halfH;
float radius;

void draw() {
 background(0, 0, 0);
 // sqrt dist()
 noStroke();
 if (dist(halfW, halfH, mouseX, mouseY) < radius) {
   fill(255, 0 , 0);
 } else {
   fill(0, 0, 255); 
 }
 ellipse(halfW, halfH, 100, 100);
}



// lab solution 

if (keyPressed) {
  float x;
  if (key == 'n') {
  x++; 
 }
 ellipse(x, halfH, 20, 20);
}