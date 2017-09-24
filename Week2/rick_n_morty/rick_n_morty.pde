import processing.sound.*;


void setup()
{
  size(500, 500);
  noStroke();
  // Load the background image
  back = loadImage("ricknmorty.jpg");
  
  // Load the soundfile
  sound = new SoundFile(this, "1.wav");
  // To play the sound
  // sound.play();
  centerX = width / 2;
  centerY = height / 2;
}

PImage back;
float centerX, centerY;
SoundFile sound;
int value;
boolean status;

void draw()
{   
  image(back,0,0); 
  if (status) {
    value = 0;
  } else {
    value = 255; 
  }
  fill(value, 0, 0);
  DrawRect();
}

void DrawRect() {
  rect(centerX - 70, centerY - 15, 140, 30);
}

// This function gets called when the mouse is pressed
void mousePressed()
{
  if (dist(centerX, centerY, mouseX, centerY) < 70) {
    if (dist(centerX, centerY, centerX, mouseY) < 15) {
      status = true;
      sound.play();
    }
  }
}

// This function gets called when the mouse is released
void mouseReleased()
{  
  status = false;
}