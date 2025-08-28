void endscreentext() {
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



void startGame() {
  score = 10;                  // Score zurück auf Anfang
  circleSize = 100;            // Kreisgröße reset
  circleX = 60;                // Startposition reset
  circleY = 60;
  ccr = 211; ccg = 211; ccb = 211; 
  running = true;              // Spiel läuft wieder
}
