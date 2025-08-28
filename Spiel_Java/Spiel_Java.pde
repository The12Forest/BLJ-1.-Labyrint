
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
int scoreout = 0;
int scorenown() {scoreout = int((((score - 11)*-1) * elapsed()) / 100); return scoreout;}


//Color of the Ball
int ccr = 211;
int ccg = 211;
int ccb = 211;
int round = 40;

//Font
PFont font;

//Highscore
ArrayList<String> usr = new ArrayList<String>();
ArrayList<Integer> scr = new ArrayList<Integer>();

//Nameinput
String input = "";
boolean typing = true;
//boolean inname = false;
//boolean usereingabe = false;


//Time
int startTime;
int elapsed() {return int((millis() - startTime)/10);}
int elapsedout() {return int((millis() - startTime)/1000);}

//ScoreCount
float scnow = 0;
float factor() {return (score/100);}


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
      scorenown();
    }

    if (circleX >= 1805 + (circleSize/2)) {
    //if (circleX >= 400 + (circleSize/2)) {
      typing = true;
      scorenown();
      uioftypeing();
      
      
    }
    
    
  }
}
