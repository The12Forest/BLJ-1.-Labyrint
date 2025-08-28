void keyPressedusername() {
  if (typing) {
    if (key == BACKSPACE) {
      if (input.length() > 0) {
        input = input.substring(0, input.length()-1); // Zeichen löschen
      }
    } else if (key == ENTER || key == RETURN) {
      typing = false;
      finish(true);
    } else if (key != CODED) {
      if (!(input.length() > 16)) {
        input += key;  // Zeichen anhängen
      }
    }
  } else {
  finish(true);
  }
}


void uioftypeing() {
  background(211);
  
  fill(0);
  textAlign(CENTER);
  text("Bitte Spielernamen eingeben:", width/2, height/2-20);
  
  fill(255);
  stroke(0);
  rect(width/2-200, height/2, 400, 40, 7);

  fill(0);
  textSize(20);
  textAlign(LEFT);
  text(input, width/2-192, height/2+28);
}
