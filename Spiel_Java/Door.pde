PImage keyImg;


void checkdorway() {
  if (!Godkey) {
    if (circleX > 1575 && circleY < 800) {
      stroke(0, 0, 200);
      fill(0, 0, 200);
      rect(1570, 650, 140, 80);
      Goddoor = true;
    }
  }
  
  if (Goddoor) {
  keyImg = loadImage("Key.png");
    image(keyImg, 200, 0, 80, 81);
      // Kollisionsabfrage für den Schlüssel
  if (Goddoor && !Godkey) {
    if (circleX > 200 && circleX < 200 + 80 &&
        circleY > 0 && circleY < 0 + 81) {
      Godkey = true;
      Goddoor = false; 
    }
  }
  }  
}
