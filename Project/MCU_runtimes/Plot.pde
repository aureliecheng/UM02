  class Plot {
    float xPos; 
    float yPos;
    float runtime;
    color backgroundColor = color(11, 9, 48);
    color highlightColor = color(122, 118, 142);
    color defaultColor = color(255);
    color plotColor;
    float diam = 12;
    
    Plot(float x, float y,float r) {
      xPos = x;
      yPos = y;
      runtime = r;
      plotColor = defaultColor;
    }
    
    boolean plotOver(float x, float y, float r) {
      if (dist(mouseX, mouseY, x, y) < r){
        return true;
      } 
      else {
        return false;
      }
    }
    
    void displayRuntime() {
      if (plotOver(xPos, yPos, diam/2)) {
        plotColor = highlightColor;
        fill(backgroundColor);
        rect(xPos+diam/2+10, yPos-10, 85, 20);
        textSize(18);
        fill(highlightColor);
        textAlign(CENTER, BOTTOM);
        text(int(runtime) + " min", xPos+diam*2+22, yPos+diam/2+5);
      }
      else {
        plotColor = defaultColor;
      }
    }
    
    void displayPlots() {
      noStroke();
      fill(plotColor);
      circle(xPos, yPos, diam);
    }
  }
