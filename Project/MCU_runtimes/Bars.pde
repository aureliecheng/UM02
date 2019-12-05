class Bars {
  float xPos; 
  float yPos;
  float barWidth;
  float barHeight = 20; // TO DO - CALCUL
  float graphWidth = width*0.8-width*0.2;
  
  Bars(float x, float y, float w) {
    xPos = x;
    yPos = y;
    barWidth = w;
  }
  void displayBars() {
    noStroke();
    fill(255);
    rect(xPos, yPos, barWidth, barHeight);
    
  }
  
}
