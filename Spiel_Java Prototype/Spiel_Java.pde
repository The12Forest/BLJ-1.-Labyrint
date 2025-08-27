import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator; 

float circleX; 
float circleY;
float circleSize = 100;
boolean dragging = false;  

<<<<<<< HEAD
int score = 100;        
boolean touching = false;  

int startTime;
float elapsedTime;
boolean gameOver = false; 

ArrayList<JSONObject> highscoreList;
int maxHighscores = 10;
=======
int score = 3;        // Start-Score
boolean touching = false;  

boolean running = true;


int ccr = 211;
int ccg = 211;
int ccb = 211;


int round = 40;

>>>>>>> 193f39ba2c7d644093bb7417f8f3de285b00ad2a

void settings() {
  fullScreen();
}

void setup() {

  circleX = 60;  
  circleY = 60;
<<<<<<< HEAD
  startTime = millis();


 highscoreList = new ArrayList<JSONObject>();
  JSONArray loaded = loadJSONArray("players.json");
  if (loaded != null) {
    for (int i = 0; i < loaded.size(); i++) {
      JSONObject p = loaded.getJSONObject(i);
      highscoreList.add(p);
    }
  }
}


void draw() {
  background(0,0,200); // 


  fill(255,0,0);
  noStroke();
  rect(0,0,120,120);

  
  stroke(255);
  fill(255);
  rect(120,0,880,120);
  rect(1000,0,120,470);
  rect(1000,350,-800,120);
  rect(200,350,120,470);
  rect(200,700,1200,120);
  rect(1280,220,120,600);
  rect(1280,200,300,120);
  rect(1575,200,120,800);
  rect(1575,900,400,120);

  
  stroke(255);
  fill(0,255,0);
  rect(1800,900,120,120);

  if (!gameOver) {
  if (dragging) { 
    float newX = constrain(mouseX, circleSize/2, width - circleSize/2);
    float newY = constrain(mouseY, circleSize/2, height - circleSize/2);

    boolean isTouching = !isWhiteArea(newX, newY, circleSize/2);

    if (isTouching && !touching) {
      if (circleSize > 5) {
        circleSize -= 1;
=======
  
  
}

void draw() {
  if (running) {
    background(0,0,200); // Blau = Wand

    // Startpunkt (rot)
    fill(255,0,0);
    noStroke();
    rect(0,0,120,120);
  
    // Korridore (weiß)
    stroke(255);
    fill(255);
    rect(120,0,880,120);
    rect(1000,0,120,470);
    rect(1000,350,-800,120);
    rect(200,350,120,470);
    rect(200,700,1200,120);
    rect(1280,220,120,600);
    rect(1280,200,300,120);
    rect(1575,200,120,800);
    rect(1575,900,400,120);
  
    // Endpunkt (grün)
    stroke(255);
    fill(0,255,0);
    rect(1800,900,120,120);
  
    // === Bewegung berechnen ===
    if (dragging) {
      float newX = constrain(mouseX, circleSize/2, width - circleSize/2);
      float newY = constrain(mouseY, circleSize/2, height - circleSize/2);
  
      boolean isTouching = !isWhiteArea(newX, newY, circleSize/2);
  
      if (isTouching && !touching) {
        if (circleSize > 5) {
          circleSize -= 1;
        }
        score--;
        println("Score: " + score + " | Kreisgröße: " + circleSize);
        
        ccr = 255;
        ccg = 0;
        ccb = 0;
        round = 100;
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
>>>>>>> 193f39ba2c7d644093bb7417f8f3de285b00ad2a
      }
    }
    
    // === Kreis erst jetzt zeichnen ===
    stroke(211);
    fill(ccr, ccg, ccb);
    ellipse(circleX, circleY, circleSize, circleSize); 
    
  
    // Score anzeigen
    fill(0);
    textSize(24);
    text("Score: " + ((100 - score) * -1), 20, 40);
    
    if (score == 0) {
        finish(false);
    }
    
    if (circleX >= 1800) {
      finish(true);
    }
  }
<<<<<<< HEAD

 
  stroke(211);
  fill(211);
  ellipse(circleX, circleY, circleSize, circleSize);

elapsedTime = (millis() - startTime) / 1000.0;

if (circleX > 1000 && circleX < 1920 && circleY > 900 && circleY < 1020) { 
  gameOver = true; 
  saveHighscore("Spieler" , score , elapsedTime); 
}
  }


  fill(0);
  textSize(24);
  text("Score: " + score, 20, 40);
  text("Zeit " + nf(elapsedTime, 1 ,2) + "s", 20 , 70);
  
  text("Top Highscores", 20, 120);
  int toShow = min(highscoreList.size(), maxHighscores);
  for (int i = 0; i <toShow; i++) {
    JSONObject p = highscoreList.get(i);
    text((i+1) + ". " + p.getString("name") +
     " | Score: " + p.getInt("score") +
     " | Zeit: " + nf(p.getFloat("time"), 1, 2) + "s", 
     20, 150 + i*30);
}
if(gameOver) {
  fill(255,0,0);
  textSize(40);
  text("Ziel erreicht!", width/2 - 100, height/2);
  }
=======
>>>>>>> 193f39ba2c7d644093bb7417f8f3de285b00ad2a
}



void finish(boolean win) {
  running = false;

  
  
  if (win) {
    background(0,255,0);
  } else {
    background(255,0,0);
  }

  
  fill(0);
  textAlign(CENTER);
  textSize(70);
  text("Ende", 960, 300);
  textSize(50);
  text("Score: " + ((score - 100) * -1), 960, 540);

  
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
      
      return false;
    }
  }
  return true;
}

void saveHighscore(String name, int scoreVal, float timeVal) {
  JSONObject player = new JSONObject();
  player.setString("name", name);
  player.setInt("score", scoreVal);
  player.setFloat("time", timeVal);
  
  highscoreList.add(player);
  
  Collections.sort(highscoreList, new Comparator<JSONObject>() {
    public int compare(JSONObject a, JSONObject b) {
      int sa = a.getInt("score");
      int sb = b.getInt("score");
      if (sa != sb) return sb - sa;  
      float ta = a.getFloat("time");
      float tb = b.getFloat("time");
      if (ta < tb) return -1;
      if (ta > tb) return 1;
      return 0;
    }
    });
    
    while (highscoreList.size() > maxHighscores) {
      highscoreList.remove(highscoreList.size()-1);
      
      JSONArray out= new JSONArray();
      for (int i = 0; i <highscoreList.size();i++) {
        out.append(highscoreList.get(i));
      }
    saveJSONArray(out, "players.json");  
      println("Highscore gespeichert (" +highscoreList.size() + "Einträge).");
    }}
      
      
