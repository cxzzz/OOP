// Program draw shape and follow the mouse
// 18.9.17

void setup() {
  size(500, 500);
  y = height / 2;
  noCursor();
}

float x = 0;
float y = 0;

void draw() {
  background(0);
  noStroke();
  fill(255, 0, 0);
  // arc
  arc(x, y, 80, 80, PI - 0.25f, TWO_PI + 0.25f, PIE);
  // rect
  fill(200);
  rect(x - 6.5, y, 15, 30);
  // ellipse
  fill(255);
  ellipse(x - 20, y - 20, 5, 5);
  ellipse(x - 10, y - 30, 5, 5);
  ellipse(x + 5, y -10, 5, 5);
  ellipse(x + 20, y - 20, 5, 5);
  x ++;
}