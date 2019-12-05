class Axes {  
  color axesColor = color(108, 108, 108);
  float originAxeX = width*0.1;
  float originAxeY = height*0.8;
  float totalHeight = 900; // TO DO - CALCULATE
  
  Axes(float x) {
    originAxeX = x+20;
  }
  
  void drawAxes() {
    fill(axesColor);
    // Y axe
    line(originAxeX, originAxeY, originAxeX, 20);
  }
}
