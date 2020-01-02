  class Bars {
    float xPos, yPos, barWidth, barHeight, screentime;
    color barColor = graphColor ;
    
    Bars(float x, float y, float w, float h, float time) {
      xPos = x;
      yPos = y;
      barWidth = w;
      barHeight = h;
      screentime = time;
    }
    
    void displayBars() {
      noStroke();
      fill(barColor);
      rect(xPos, yPos, barWidth, barHeight);
      textSize(16);
      textAlign(LEFT, BOTTOM);
      //text(nf(screentime, 0, 1), xPos+barWidth+10, yPos+barHeight);
    }
  }
