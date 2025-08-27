
// TODO Print array to screen on line 164

//Ball cords and Size
float circleX = 60; 
float circleY = 60;
float circleSize = 100;
int shrink = 9;

//Tracking
boolean dragging = false;  


boolean touching = false;  
boolean running = true;
int score = 10;


//Color of the Ball
int ccr = 211;
int ccg = 211;
int ccb = 211;
int round = 40;


//Highscore
  IntDict list;
void highscoresetup() {
  list = new IntDict();

}


void settings() {
  fullScreen();
}



void setup() {
  highscoresetup();
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
        
        dragging = false;
        score--;
        
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
    

    stroke(211);
    fill(ccr, ccg, ccb);
    ellipse(circleX, circleY, circleSize, circleSize); 
  
    // Score anzeigen
    fill(0);
    textSize(24);
    text("Score: " + score, 20, 40);
    

    // Finish triggers
    if (score == 0) {
        finish(false);
    }

    if (circleX >= 1805 + (circleSize/2)) {
      finish(true);
    }
  }
}

void finish(boolean win) {
  running = false;

  if (win) {
    background(0, 255, 0);
    list.set("Player 12", score);
    list.sortValues();
    if (list.size() > 10) {
      for (String k : list.keys()) {
        if (list.get(k) == 10) {
          list.remove(k);
        }
      }
    }
  } else {
    background(255, 0, 0);
  }
  
  //Insret List
  
  int sizelist = 30;
  int space = 10;
  int startx = (width/4*3);
  int starty = 50;
  
  int rl = 0;
  int ls = list.size();
  
  while (rl < ls) {    
    fill(255);
    textSize(16);
    
    
    rl++;
  }

  
  //End Screen
  
  
  fill(0);
  textAlign(CENTER);
  
  
  textSize(70);
  text("Ende", width/2, height/3);
  
  
  PFont font;
  font = loadFont("Anurati-Regular-48.vlw");
  textFont(font);
  
  textSize(100);
  text("ENDE", width/2, 300);
  
  
  
  font = loadFont("AgencyFB-Bold-48.vlw");
  textFont(font);
  
  textSize(50);
  text("SCORE: " + score, width/2, 540);


  textSize(50);
  text("Press Space-Bar to play again", width/2, height/2 + 100);
  
  
  textAlign(LEFT);
  font = loadFont("LucidaSans-48.vlw");
  textFont(font);
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
