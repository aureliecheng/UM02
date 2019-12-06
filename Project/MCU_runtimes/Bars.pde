class Bars {
  float xPos = 0; 
  float yPos;
  float barWidth;
  float barHeight;
  
  Bars(float x, float y, float w, float h) {
    xPos = x;
    yPos = y;
    barWidth = w;
    barHeight = h;
  }
  
  void displayBars() {
    noStroke();
    fill(255);
    rect(xPos, yPos, barWidth, barHeight); 
  }
  
  
  
  
}
