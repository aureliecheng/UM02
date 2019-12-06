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
 
  displayHeadline();
  displayTitle();
  //axes.drawAxes();
  for(int i=0; i<data.dataLength; i++) {
    // Movie name
    data.movieLabel[i].displayName();
    // Bars
    data.bars[i].displayBars();
  }
  
}
  
void displayHeadline(){
  textSize(30);
  textAlign(CENTER);
  text("Marvel Marathon – How long would it take to watch all the Marvel movies?", width*0.5, height*0.1); 
}

void displayTitle(){
  textSize(20);
  textAlign(CENTER);
  text("Total runtime of all Marvel movies in the MCU “Infinity Saga” (source from Wikipedia)", width*0.5, height*0.1+30); 
}
