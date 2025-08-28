void mousePressed() {
  float d = dist(mouseX, mouseY, circleX, circleY);
  if (d < circleSize/2) {  
    dragging = true;
  }
}

void mouseReleased() {
  dragging = false;
}


void keyPressed() {
  if (!running && key == ' ') {   // Neustart nur im Ende-Menü
    startGame();
  }
  
  if (typing) {
    keyPressedusername();
  }
}
