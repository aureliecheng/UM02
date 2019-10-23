// 1. make a bar graph score in function of the characters
// start first on paper : everything u need to know to make this barchart
Table table;
StringList inventoryCharacter;
FloatList inventoryScore;
int limit = 20;
float barWidth = 15;
int space = 50;
float xScale;
float yScale;


void setup() {
  size(1000, 750);
  background(255);
  loadData();
  barchart();
}

void loadData() {
  table = loadTable("GOT.csv", "header");
  // Sort the table into score order
  table.sortReverse("score");
  inventoryCharacter = new StringList();
  inventoryScore = new FloatList();
  // For the first 20
  for(int i=0; i<limit; i++) {
    inventoryCharacter.append(table.getRow(i).getString("short_name"));
    inventoryScore.append(table.getRow(i).getFloat("score")*100);
  }
  println(inventoryScore);
}

void draw() {
  drawAxes();
  drawBars();

}

void drawAxes() {
  strokeWeight(4);
  // Draw x axe line(x1, y1, x2, y2)
  line(130, 700, 900, 700);
  // Draw y axe
  line(130, 700, 130, 50);
  // ###############TO DO ADD LABELS##################
}


void drawBars() {
  float x, y;
  
  noStroke();
  // Set start x point value
  float xStart = 130+space;
  // Draw bar
  fill(0);
  rect(xStart, 700, barWidth, -300);
  for(int i=0; i<inventoryCharacter.size(); i++) {
    // We need to re-scale the score
    // x = ;
    // y = ;
    // Update xStart
    // xStart = xStart+barWidth+space; 
    //rect(x
    
  
  }

}
