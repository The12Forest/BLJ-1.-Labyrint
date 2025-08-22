float circleX; 
float circleY;
float circleSize = 100;

void settings() {
 fullScreen();
}

void setup() {
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
