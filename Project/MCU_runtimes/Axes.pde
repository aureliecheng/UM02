class Axes {
  float x = data.startGraphX+20;
  float graphWidth = data.graphWidth;
  float runtimeMax = data.runtimeMax;
  float y1 = height*0.2-data.barHeight;
  float y2 = height*0.89;
  float totalHeight = 900; // TO DO - CALCULATE
  
  
  
  void drawAxes() {
    stroke(255);
    strokeWeight(0.7);
    textSize(16);
    line(x, y1, x, y2);
    text("0", x, y2+20);
    line(x+graphWidth*50/runtimeMax, y1, x+graphWidth*50/runtimeMax, y2); //50
    text("50", x+graphWidth*50/runtimeMax, y2+20);
    line(x+graphWidth*100/runtimeMax, y1, x+graphWidth*100/runtimeMax, y2); //100
    text("100", x+graphWidth*100/runtimeMax, y2+20);
    line(x+graphWidth*150/runtimeMax, y1, x+graphWidth*150/runtimeMax, y2); //150
    text("150", x+graphWidth*150/runtimeMax, y2+20);
  }
}
