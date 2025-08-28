import java.util.ArrayList; 

void finish(boolean win) {
  running = false;
  
  if (win) {
    background(0, 255, 0);
    
  } else {
    background(255, 0, 0);
  }
  
  makehighscore(win);
  
  endscreentext();
}
