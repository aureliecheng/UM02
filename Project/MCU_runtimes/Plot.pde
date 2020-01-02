  class Plot {
    float xPos; 
    float yPos;
    float runtime;
    color backgroundColor = color(4, 52, 116);
    color plotColor = defaultColor;
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
        fill(backgroundColor);
        rect(xPos+diam/2+10, yPos-10, 65, 20);
        textSize(18);
        fill(plotColor);
        textAlign(CENTER, BOTTOM);
        text(int(runtime) + " min", xPos+diam*2+22, yPos+diam/2+5);
      }
    }
    
    void displayPlots() {
      noStroke();
      fill(plotColor);
      circle(xPos, yPos+2, diam);
    }
  }
