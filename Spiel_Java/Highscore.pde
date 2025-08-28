void makehighscore(boolean win) {
  if (win) {
    background(0, 255, 0);
    
    scr.add(int(scoreout));
    usr.add(input);
    sortHighscore();
    
    if (scr.size() > 10) {
      scr.remove(9);
      usr.remove(9);
    }
  } else {
    background(255, 0, 0);
  }
  
  
  //Insret List
  
  int space = 10;
  int startx = (width/4*3);
  int starty = 300;
  
  int rl = 0;
  int ls = usr.size();
  
  
  font = loadFont("AgencyFB-Bold-48.vlw");
  textFont(font);
  textSize(45);
  text("Highscores:", startx-5, starty-55);

  while (rl < ls) {    
    fill(0);
    textSize(30);
    text(rl + 1 + ".", startx, starty);
    text(usr.get(rl), startx + 30, starty);
    text(scr.get(rl), startx + 290, starty);
    starty += (space + 30);
    rl++;
  }
}




void sortHighscore() {
  for (int i = 0; i < scr.size()-1; i++) {
    for (int j = i+1; j < scr.size(); j++) {
      if (scr.get(j) < scr.get(i)) {
        int tempP = scr.get(i);
        scr.set(i, scr.get(j));
        scr.set(j, tempP);
        
        String tempN = usr.get(i);
        usr.set(i, usr.get(j));
        usr.set(j, tempN);
      }
    }
  }
}
