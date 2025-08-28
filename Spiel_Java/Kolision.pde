boolean isWhiteArea(float x, float y, float r) {
  int steps = 36;
  for (int i = 0; i < steps; i++) {
    float angle = TWO_PI * i / steps;
    int px = int(x + cos(angle) * r);
    int py = int(y + sin(angle) * r);
    if (px < 0 || px >= width || py < 0 || py >= height) return false;
    color c = get(px, py);
    if (c != color(255) && c != color(255,0,0) && c != color(0,255,0)) {
      // nur weiß, rot (Start) oder grün (Ziel) erlaubt
      return false;
    }
    if (!Godkey) {
      if (circleX > 1500) {
        if (circleY > 650 - circleSize/2) {
          circleY -= 5;
          return false;
        }
      }
    }
  }
  return true;
}
