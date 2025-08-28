PImage keyImg;

boolean __dk_areaClear36(float x, float y, float r) {
  int steps = 36;
  for (int i = 0; i < steps; i++) {
    float angle = TWO_PI * i / steps;
    int px = int(x + cos(angle) * r);
    int py = int(y + sin(angle) * r);
    if (px < 0 || px >= width || py < 0 || py >= height) return false;
    color c = get(px, py);

    int rc = int(red(c)), gc = int(green(c)), bc = int(blue(c));
    if (!((rc==255&&gc==255&&bc==255)||(rc==255&&gc==0)||(gc==255&&rc==0))) return false;
  }
  return true;
}

void __dk_updateDoorKey() {
  if (!Godkey && circleX > 1575 && circleY < 800) {
    fill(0,0,200); rect(1570,650,140,80);
    Goddoor = true;
  }

  if (Goddoor) {
    if (keyImg == null) keyImg = loadImage("Key.png");
    image(keyImg,200,0,80,81);

    // hier statt doppeltem Code deine Kollisionsfunktion nutzen:
    if (!Godkey && circleX > 200 && circleX < 280 && circleY > 0 && circleY < 81) {
      Godkey = true;
      Goddoor = false;
    }
  }
}

// Alias, damit alte Aufrufe von checkdorway() weiterlaufen
void checkdorway() {
  __dk_updateDoorKey();
}
