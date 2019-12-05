Data data;
Axes axes;
Bars bars;
MovieLabel movieLabel;
int maxNameLength;

void setup() {
  fullScreen();
  data = new Data();
  data.loadData();
  
  //axes = new Axes(maxNameLength);
  
  
}

void draw() {
  background(0);
  //axes.drawAxes();
  for(int i=0; i<data.dataLength; i++) {
    // Movie name
    data.movieLabel[i].displayName();
    // Bars
    data.bars[i].displayBars();
  }
  circle(width*0.8, height*0.2, 2);
}
