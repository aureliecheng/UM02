class Bars {
  float xPos; 
  float yPos;
  float barWidth;
  float barHeight;
  float runtime;
  color highlightColor = color(100);
  color defaultColor = color(255);
  color barColor;
  
  Bars(float x, float y, float w, float h, int r) {
    xPos = x;
    yPos = y;
    barWidth = w;
    barHeight = h;
    runtime = r;
    barColor = defaultColor;
  }
  
  boolean barOver(float x, float y, float w, float h) {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else {
      return false;
    }
  }
  
  void displayRuntime() {
    if (barOver(xPos, yPos, barWidth, barHeight)) {
      barColor = highlightColor;
      textAlign(LEFT);
      text(runtime, xPos+barWidth, yPos+barHeight);
    }
    else {
      barColor = defaultColor;
    }
  }
  
  void displayBars() {
    noStroke();
    fill(barColor);
    rect(xPos, yPos, barWidth, barHeight);
  }
}
