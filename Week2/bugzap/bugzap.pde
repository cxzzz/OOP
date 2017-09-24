// Bugzap game
// Oringal Author: Bryan Duggan
// 
// Title: Lab 2 Exercise
// Name: Chenxi Zhang
// Date: 19.9.17

public void setup() {
  size(800, 600);
  smooth(); 
  frameRate(60);
  // Playground = 30, 770
  centerX = width / 2;
  centerY = height / 2;
  playerX = width / 2;
  playerY = height - 50;
  halfL = sqrt(1600/3) / 2;
  gameStatus = false;
  playerSpeed = 6;
}
float halfL;
float centerX, centerY;
float playerX, playerY, playerSpeed;
float bugPosX, bugPosY, bugSpeed;
int score = 0;
boolean gameStatus, gameOver;
boolean left, right, up;

public void draw() {
  // Background to black
  background(0, 0, 0);
  // test borders
  //line(50, 30, 50, 570);
  //line(50, 30, 750, 30);
  //line(750, 570, 50, 570);
  //line(750, 30, 750, 570);
  if (gameStatus) {
    textAlign(LEFT);
    fill(#FFFFFF);
    textSize(14);
    text("Score " + score, 10, 15);
    stroke(255, 255, 255);
    fill(0, 0, 0);
    SpawnPlayer();
    SpawnBug();
    if (frameCount % 40 == 0) {
      if (bugPosY <= centerY) {
        bugSpeed = random(10, 25);
      } else {
        bugSpeed = random(30, 40);  
      }
      bugPosX = random(bugPosX - bugSpeed, bugPosX + bugSpeed);
      bugPosY = random(bugPosY, bugPosY + bugSpeed);
      bugPosX = CheckBound(bugPosX);
    }
    if (bugPosY > playerY) {
      gameOver = true;
      gameStatus = false;
    }
  } else {
    if (gameOver) {
      textAlign(CENTER);
      textSize(24);
      text("GAME OVER", centerX, centerY - 120);
      text("Score " + score, centerX, centerY - 80);
    }
    Splash(); 
  }
}

public float CheckBound(float position) {
  if (position < 50) {
    position = random(position, position + bugSpeed);
  } else if (position > 750) {
    position = random(position - bugSpeed, position);
  } 
  return position;
}

public void SpawnBug() {
  // main triangle
  triangle(bugPosX, bugPosY, bugPosX - halfL, bugPosY + 20, bugPosX + halfL, bugPosY + 20);
  // legs
  triangle(bugPosX, bugPosY + 20, bugPosX - 6, bugPosY + 20, bugPosX - 9, bugPosY + 25);
  triangle(bugPosX, bugPosY + 20, bugPosX + 6, bugPosY + 20, bugPosX + 9, bugPosY + 25);
  // eyes
  ellipse(bugPosX - 2, bugPosY + 9, 1, 1);
  ellipse(bugPosX + 2, bugPosY + 9, 1, 1);
  // mouth
  line(bugPosX - 2, bugPosY + 12, bugPosX + 2, bugPosY + 12);
}

public void SpawnPlayer() {
 // Bot Part
 // One horizontal line
 line(playerX - 14, playerY + 20, playerX + 14, playerY + 20);
 // Two vertical lines
 line(playerX - 14, playerY + 20, playerX - 14, playerY + 14);
 line(playerX + 14, playerY + 20, playerX + 14, playerY + 14);
 // Two slanted lines
 line(playerX - 14, playerY + 14, playerX - 10, playerY + 12);
 line(playerX + 14, playerY + 14, playerX + 10, playerY + 12);
 // Top Horizontal line
 line(playerX - 10, playerY + 12, playerX + 10, playerY + 12);
 // Mid Lazer
 line(playerX, playerY + 12, playerX, playerY + 10);
}

public void Splash() {
  fill(255, 255, 255);
  textSize(18);
  textAlign(CENTER);
  if (!gameOver) {
    text("BUGZAP!", centerX, centerY - 70);
    text("PROGRAMMED BY BRYAN DUGGAN", centerX, centerY - 45);
  }
  text("PRESS SPACE TO PLAY", centerX, centerY - 15);
}

public void ResetBug() {
  bugPosX = random(50, 750);
  bugPosY = 30;  
}

public void keyPressed() {
  if (keyCode == LEFT) {
    left = true;
  } else if(keyCode == RIGHT) {
    right = true;
  }
  
  if (keyCode == UP) {
    up = true;
  }
  
  if (left) {
    playerX -= playerSpeed; 
  }
  
  if (right) {
    playerX += playerSpeed; 
  }
  
  if (up) {
    line(playerX, playerY + 12, playerX, 0);
    if(dist(playerX, playerY +12, bugPosX, playerY + 12) < halfL) {
      score++;
      ResetBug();
      SpawnBug();
    }
  }
  if (!gameStatus) {
    if (keyCode == ' ') {
      gameStatus = true; 
      gameOver = false;
      ResetBug();
      score = 0;
    }
  }
}

public void keyReleased() {
 if (keyCode == UP) {
   up = false; 
 }
 if (keyCode == LEFT) {
   left = false; 
 }
 if (keyCode == RIGHT) {
   right = false; 
 }
}