void finish(boolean win) {
  running = false;

  if (win) {
    background(0, 255, 0);
    /*
    if (int(scr[9]) > int(score)) {
      
      
      //Texteingabe hier einfügen.
      
      
      scr.set(10, int(score));
      usr.set(10, "playerNEW");
    }
    */
  } else {
    background(255, 0, 0);
  }
  

  //Insret List
  
  int space = 10;
  int startx = (width/4*3);
  int starty = 300;
  
  int rl = 0;
  //int ls = list.size();
  int ls = 3;
  while (rl < ls) {    
    fill(0);
    textSize(30);
    //text(usr[rl] + "    :    " + scr[rl], startx, starty);
    starty += space;
    starty += 30;
    rl++;
  }
  endscreentext();
}
