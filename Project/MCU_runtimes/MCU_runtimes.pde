////////////TO DO////////////////////
/*
 * Scale text title, headline, names
 * Display  total
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
  background(11, 9, 48);
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
  data.totalRuntime();
}

void displayHeadline(){
  textSize(34);
  textAlign(CENTER);
  text("How long is the Marvel MCU Marathon?", width*0.5, height*0.1); 
}

void displayTitle(){
  textSize(20);
  textAlign(CENTER);
  text("Total runtime of all Marvel movies in the MCU “Infinity Saga” (source from Wikipedia). Timeline in chronological order.", width*0.5, height*0.1+30); 
}
