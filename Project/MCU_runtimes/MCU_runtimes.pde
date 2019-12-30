Data data;
Axes axes;
MovieLabel movieLabel;
Total total;
color selectColor = color(122, 118, 142);
color defaultColor = color(255);
IntList movieSelected;

void setup() {
  fullScreen();
  data = new Data();
  data.loadData();
  movieSelected = new IntList();
  axes = new Axes();
  total = new Total();
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
    // plot
    data.plot[i].displayPlots();
    data.plot[i].displayRuntime();
  }
  total.displayTotalRuntime(0);
}

void mouseClicked() {
  for(int i=0 ; i<data.dataLength; i++) {
    if(data.movieLabel[i].labelOver()) {
      data.movieLabel[i].isClicked = !data.movieLabel[i].isClicked;
      if(data.movieLabel[i].isClicked){
        total.displayTotalRuntime(data.movieLabel[i].runtime); 
      }
      else {
        total.displayTotalRuntime(-data.movieLabel[i].runtime);
      }
    }
  }
}

void displayHeadline(){
  textSize(34);
  textAlign(CENTER);
  text("How long is the Marvel Marathon?", width*0.5, height*0.1); 
}

void displayTitle(){
  textSize(20);
  textAlign(CENTER);
  text("Total runtime of all Marvel movies in the MCU “Infinity Saga” (source from Wikipedia). Timeline in chronological order.", width*0.5, height*0.1+30); 
}
