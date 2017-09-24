// 19.9.17 Week2
//
// Conditions in Processing.
//

void setup() {
 size(500, 500);
 halfW = width / 2;
 halfH = height / 2;
}

boolean isTopLeft(float x, float y) {
 return x < halfW && y < halfH;; 
}

float halfW,halfH;

void draw() {
 /*if (mouseX <= halfW) {
   background(0, 0, 255);
 } else {
   background(255, 0, 0);
 }*/
 background(0, 0, 255);
 fill(255, 0, 0);
 // Quadrants
 // boolean topLeft =  ;  // boolean var
 if (isTopLeft(mouseX, mouseY)) {
   // top left
   rect(0, 0, halfW, halfH);
 } else if ((mouseX >= halfW) && (mouseY < halfH)) {
   // top right
   rect(halfW, 0, halfW, halfH);
 } else if ((mouseX < halfW) && (mouseY >= halfH)) {
   // bot left
   rect(0, halfH, halfW, halfH);
 } else {
   // bot right
   rect(halfW, halfH, halfW, halfH); 
 }
}