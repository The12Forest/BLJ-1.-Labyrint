float circleX; 
float circleY;
float circleSize = 100;
boolean dragging = false;  
int shrink = 9;

int score = 10;        // Start-Score (Anzahl "Leben")
boolean touching = false;  
boolean running = true;

int ccr = 211;
int ccg = 211;
int ccb = 211;

int round = 40;

void settings() {
  fullScreen();
}

void setup() {
  startGame(); 
}

void draw() {
  if (running) {
    background(0, 0, 200); // Blau = Wand

    // Startpunkt (rot)
    fill(255, 0, 0);
    noStroke();
    rect(0, 0, 120, 120);
  
    // Korridore (weiß)
    stroke(255);
    fill(255);
    rect(120, 0, 880, 120);
    rect(1000, 0, 120, 470);
    rect(1000, 350, -800, 120);
    rect(200, 350, 120, 470);
    rect(200, 700, 1200, 120);
    rect(1280, 220, 120, 600);
    rect(1280, 200, 300, 120);
    rect(1575, 200, 120, 800);
    rect(1575, 900, 400, 120);
  
    // Endpunkt (grün)
    stroke(255);
    fill(0, 255, 0);
    rect(1800, 900, 120, 120);
  
    // === Bewegung berechnen ===
    if (dragging) {
      float newX = constrain(mouseX, circleSize/2, width - circleSize/2);
      float newY = constrain(mouseY, circleSize/2, height - circleSize/2);
  
      boolean isTouching = !isWhiteArea(newX, newY, circleSize/2);
  
      if (isTouching && !touching) {
        if (circleSize > 5) {
          circleSize -= shrink;
        }
        score--;
        println("Score: " + score + " | Kreisgröße: " + circleSize);
        
        ccr = 255;
        ccg = 0;
        ccb = 0;
        round = 40;
      } else {
        if (round == 0) {
          ccr = 211;
          ccg = 211;
          ccb = 211;
        } else {
          round--;
        }
      } 
      touching = isTouching;
  
      if (!isTouching) {
        circleX = newX;
        circleY = newY;
      }
    }
    
    // === Kreis zeichnen ===
    stroke(211);
    fill(ccr, ccg, ccb);
    ellipse(circleX, circleY, circleSize, circleSize); 
  
    // Score anzeigen
    fill(0);
    textSize(24);
    text("Score: " + score, 20, 40);
    
    if (score <= 0) {
      finish(false);
    }
    
    if (circleX >= 1800) {
      finish(true);
    }
  }
}

void finish(boolean win) {
  running = false;

  if (win) {
    background(0, 255, 0);
  } else {
    background(255, 0, 0);
  }
  
  fill(0);
  textAlign(CENTER);
  textSize(70);
  text("Ende", width/2, height/3);
  textSize(50);
  text("Score: " + score, width/2, height/2);
  text("Press Space-Bar to play again", width/2, height/2 + 100);
}

void keyPressed() {
  if (!running && key == ' ') {   // Neustart nur im Ende-Menü
    startGame();
  }
}

void startGame() {
  score = 10;                  // Score zurück auf Anfang
  circleSize = 100;            // Kreisgröße reset
  circleX = 60;                // Startposition reset
  circleY = 60;
  ccr = 211; ccg = 211; ccb = 211; 
  running = true;              // Spiel läuft wieder
}

void mousePressed() {
  float d = dist(mouseX, mouseY, circleX, circleY);
  if (d < circleSize/2) {  
    dragging = true;
  }
}

void mouseReleased() {
  dragging = false;
}

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
  }
  return true;
}
