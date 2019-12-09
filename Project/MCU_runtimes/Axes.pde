class Axes {
  float x = data.startGraphX+20;
  float graphWidth = data.graphWidth;
  float runtimeMax = data.runtimeMax;
  float y1 = height*0.2-data.barHeight;
  float y2 = height*0.9;
  float totalHeight = 900; // TO DO - CALCULATE
  
  
  
  void drawAxes() {
    stroke(255);
    /*int[] axesValue = {0,50, 100, 150};
   
    for(int i=0 ; i<axesValue.length ; i++) {
      line(x, y1, x, y2);
      float barWidth = graphWidth*axesValue[i]/runtimeMax;
      x += barWidth;
    }*/
    line(x, y1, x, y2);//0
    line(x+graphWidth*50/runtimeMax, y1, x+graphWidth*50/runtimeMax, y2);
    line(x+graphWidth*100/runtimeMax, y1, x+graphWidth*100/runtimeMax, y2);
    line(x+graphWidth*150/runtimeMax, y1, x+graphWidth*150/runtimeMax, y2);
    
    
  }
}
