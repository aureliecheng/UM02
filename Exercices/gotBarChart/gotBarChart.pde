Table table;
StringList inventoryCharacters;
FloatList inventoryScore;
int nbBars = 20;
Bar[] bars = new Bar[nbBars];
float graphWidth = width*0.7;
float barWidth = graphWidth/(nbBars*2);
float space = 2*barWidth;
float yMax = -1;
boolean showNames;
color defaultColor = color(128, 128, 128);
color highlightColor = color(64, 64, 64);
color buttonColor = defaultColor;

void setup() {
  graphWidth = width*0.7;
  barWidth = graphWidth/(nbBars*2);
  space = 2*barWidth;
  fullScreen();
  loadData();
  float x = width*0.15;
  float h;
  float score;
  String name;
  for(int i=0 ; i<nbBars; i++) {
    h = inventoryScore.get(i)*(height*0.8-height*0.1)/yMax;
    name = inventoryCharacters.get(i);
    score = inventoryScore.get(i);
    bars[i] = new Bar(x, h, name, score);
    x = x+space;
  }
}

void loadData() {
  table = loadTable("GOT.csv", "header");
  // Sort the table into score order
  table.sortReverse("score");
  inventoryCharacters = new StringList();
  inventoryScore = new FloatList();
  // For the first 20
  for(int i=0; i<nbBars; i++) {
    inventoryCharacters.append(table.getRow(i).getString("short_name"));
    inventoryScore.append(table.getRow(i).getFloat("score")*10);
    if(yMax<inventoryScore.get(i)) {
      yMax = inventoryScore.get(i);
    }
  }
  yMax=int(yMax)+5;
}

void draw() {
  background(237, 237, 237);
  displayTitle();
  drawButtons();
  drawAxes();
  for(int i=0; i<inventoryScore.size(); i++) {
    // If show name button is selected
    if(showNames) {
      // Change color when rollover bar + Display the name and score associated to the bar
      bars[i].displayDetails();
    }
    bars[i].drawBars();
  }
}


void displayTitle() {
  textSize(40);
  textAlign(CENTER);
  text("Who are the main characters of Game of Thrones?", width*0.5, height*0.1+30);
  textSize(28);
  text("Scores calculated with the relationship between each characters according to the books (source from UM02)", width*0.5, height*0.17);
}

// -------------------------- AXES --------------------------

void drawAxes() {
  stroke(defaultColor);
  strokeWeight(4);
  fill(defaultColor);
  // X axe
  line(width*0.15, height*0.8, width*0.85, height*0.8);
  triangle(width*0.85, height*0.8-10, width*0.85+10, height*0.8, width*0.85, height*0.8+10);
  // Y axe
  line(width*0.15, height*0.8, width*0.15, height*0.2);
  triangle(width*0.15-10, height*0.2, width*0.15, height*0.2-10, width*0.15+10, height*0.2);
  textSize(18);
  text("0", width*0.15-20, height*0.8);
  text("Score", width*0.10, height*0.2);
  text("Character", width*0.5, height*0.85);
}

// -------------------------- BUTTONS --------------------------

void drawButtons() {
  strokeWeight(2);
  stroke(buttonColor);
  noFill();
  rect(width*0.15, height*0.9, 120, 40);
  fill(buttonColor);
  textSize(16);
  // Button to reveal the name of the character of a bar
  textAlign(CENTER, CENTER);
  text("Show details", width*0.15+60, height*0.9+20);
}

void mousePressed() {
  // Button show characters
  if(buttonOver(width*0.15, height*0.9, 120, 40)){
    if(showNames) {
      showNames = false;
      buttonColor = defaultColor;
    }
    else {
      showNames = true;
      buttonColor = highlightColor;
    }
  }
}

boolean buttonOver(float x, float y, float w, float h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    return true;
  } 
  else {
    return false;
  }  
}

// -------------------------- BARS --------------------------

class Bar {
  color barColor;
  float xBar;
  float barHeight;
  String name;
  float score;
  
  Bar(float x, float h, String n, float s) {
    barColor = defaultColor;
    xBar = x;
    barHeight = h;
    name = n;
    score = s;
  }
  
  boolean barOver(float x, float y, float w, float h) {
    if (mouseX >= x && mouseX <= x+w && mouseY >= h && mouseY <= y) {
      return true;
    } 
    else {
      return false;
    }  
  }
  
  void drawBars() {
    noStroke();
    fill(barColor);
    rect(xBar, height*0.8, barWidth, -barHeight);
  }
  
  void displayDetails() {
    if (barOver(xBar, height*0.8, barWidth, barHeight)) {
      barColor = highlightColor;
      scoreLine();
      textAlign(LEFT);
      text(name, width*0.85, height*0.8-barHeight-10);
    }
    else {
      barColor = defaultColor;
    }
  }
  
  void scoreLine() {
    strokeWeight(2);
    stroke(highlightColor);
    line(width*0.15-40, height*0.8-barHeight+1, width*0.85, height*0.8-barHeight+1);
    fill(highlightColor);
    text(score, width*0.10, height*0.8-barHeight-10);
  }
}
