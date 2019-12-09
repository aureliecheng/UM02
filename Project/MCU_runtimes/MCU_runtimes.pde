////////////TO DO////////////////////
/*
 * Scale text title, headline, names
 * Total bar
*/

Data data;
Axes axes;

void setup() {
  fullScreen();
  //size(1000,600);
  data = new Data();
  data.loadData();
  axes = new Axes();
}

void draw() {
  background(0);
  fill(255);
  displayHeadline();
  displayTitle();
  axes.drawAxes();
  for(int i=0; i<data.dataLength; i++) {
    // Movie name
    data.movieLabel[i].displayName();
    // Bars
    data.bars[i].displayBars();
    data.bars[i].displayRuntime();
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
