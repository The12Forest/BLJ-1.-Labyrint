float circleX; 
float circleY;
float circleSize = 100;

void settings() {
  size(displayWidth, displayHeight);
}

void setup() {
  int w = int(displayWidth * 1);
  int h = int(displayHeight * 1);
  surface.setSize(w, h);
  surface.setLocation(int(displayWidth * 0.05), int(displayHeight * 0.05));
  background(0);

 
  circleX = width/2;
  circleY = height/2;
}

void draw() {
  background(0);

  stroke(211, 211, 211);
  fill(211, 211, 211);
  ellipse(circleX, circleY, circleSize, circleSize);


  if (mousePressed) {
    circleX = mouseX;
    circleY = mouseY;
  }
}
