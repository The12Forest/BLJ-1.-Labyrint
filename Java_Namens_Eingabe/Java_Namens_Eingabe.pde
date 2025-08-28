String input = "";
boolean typing = true; 


void setup() {
  size(498, 385);   // Fenstergröße wie gewünscht
}

void draw() {
  background(220);
  textSize(18);
fill(0);
text("Bitte Namen eingeben:", 50, 130);

  
  // Eingabebalken zeichnen
  fill(255);
  stroke(0);
  rect(50, 150, 400, 40, 7);  // ein Balken mit runden Ecken

  // Text anzeigen
  fill(0);
  textSize(20);
  text(input, 60, 178);
}

void keyPressed() {
  if (typing) {
    if (key == BACKSPACE) {
      if (input.length() > 0) {
        input = input.substring(0, input.length()-1); // Zeichen löschen
      }
    } else if (key == ENTER || key == RETURN) {
      typing = false;   // Eingabe beenden
      println("Username ist: " + input);
    } else if (key != CODED) {
      input += key;  // Zeichen anhängen
    }
  }
}
