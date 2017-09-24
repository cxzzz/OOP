// Program draw shape and follow the mouse
// 18.9.17

void setup() {
  size(500, 500);

  noCursor();
}

void draw() {
  background(0);
  noStroke();
  fill(255, 0, 0);
  // arc
  arc(mouseX, mouseY, 80, 80, PI - 0.25f, TWO_PI + 0.25f, PIE);
  // rect
  fill(200);
  rect(mouseX - 6.5, mouseY, 15, 30);
  // ellipse
  fill(255);
  ellipse(mouseX - 20, mouseY - 20, 5, 5);
  ellipse(mouseX - 10, mouseY - 30, 5, 5);
  ellipse(mouseX + 5, mouseY -10, 5, 5);
  ellipse(mouseX + 20, mouseY - 20, 5, 5);
  
}