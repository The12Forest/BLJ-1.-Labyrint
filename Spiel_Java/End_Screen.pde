void endscreentext() {
  //End Screen
  fill(0);
  textAlign(CENTER);
  
  
  textSize(70);
  text("Ende", width/2, height/3);
  
  
  font = loadFont("Anurati-Regular-48.vlw");
  textFont(font);
  
  textSize(100);
  text("ENDE", width/2, 300);
  
  font = loadFont("AgencyFB-Bold-48.vlw");
  textFont(font);
  
  textAlign(LEFT);
  text(score, width/2 + 200, 540);
  text(elapsedout() + " sec.", width/2 + 200, 600);
  text(scoreout, width/2 + 200, 660);
  
  textAlign(CENTER);
  textSize(50);
  text("SCORE: ", width/2, 540);
  text("TIME : ", width/2, 600);
  text("Overall SCORE : ", width/2, 660);


 
  
  
  
  textSize(50);
  text("Press Space-Bar to play again", width/2, height/20*18);
  
  textAlign(LEFT);
  font = loadFont("LucidaSans-48.vlw");
  textFont(font);
}

int scorenow() {
  if (scnow != score) {
    scnow = (scnow + factor()); 
  }
  return int(scnow);
}

void startGame() {
  score = 10;
  circleSize = 100;
  circleX = 60;
  circleY = 60;
  ccr = 211; ccg = 211; ccb = 211; 
  running = true;
  startTime = millis();
  try {input = "";} catch (Throwable t) {}
  
}
