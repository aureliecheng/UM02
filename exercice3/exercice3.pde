Table table;
StringList inventoryCharacters;
FloatList inventoryScore;
int nbBars = 20;
Bar[] bars = new Bar[nbBars];
float barWidth = 30;
float space = 65;
float yMax = -1;
boolean showNames;
color buttonHighlight = color(0);

void setup() {
  fullScreen();
  background(255);
  loadData();
  float x = width*0.1 - barWidth;
  float h;
  float score;
  String name;
  for(int i=0 ; i<nbBars; i++) {
    x = x+space;
    h = inventoryScore.get(i)*(height*0.8-height*0.1)/yMax;
    name = inventoryCharacters.get(i);
    score = inventoryScore.get(i);
    bars[i] = new Bar(x, h, name, score);
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
  background(255);
  drawButtons();
  drawAxes();
  for(int i=0; i<inventoryScore.size(); i++) {
    // If show name button is selected
    if(showNames) {
      // Change color when rollover bar + Display the name associated to the bar
      bars[i].displayName();
    }
    bars[i].drawBars();
  }
}

void drawAxes() {
  stroke(0);
  strokeWeight(4);
  fill(0);
  // Draw x axe
  line(width*0.1, height*0.8, width*0.8, height*0.8);
  triangle(width*0.8, height*0.8-10, width*0.8+10, height*0.8, width*0.8, height*0.8+10);
  // Draw y axe
  line(width*0.1, height*0.8, width*0.1, height*0.1);
  triangle(width*0.1-10, height*0.1, width*0.1, height*0.1-10, width*0.1+10, height*0.1);
  // ###############TO DO ADD LABELS##################
  text("0", width*0.1-20, height*0.8);
  text("5", width*0.1-20, height*0.8-5*(height*0.8-height*0.1)/yMax);
  text("10", width*0.1-25, height*0.8-10*(height*0.8-height*0.1)/yMax);
  text("15", width*0.1-25, height*0.8-15*(height*0.8-height*0.1)/yMax);
}

void drawButtons() {
  stroke(buttonHighlight);
  noFill();
  rect(width*0.85, height*0.3, 120, 40);
  fill(0);
  textSize(16);
  // Button to reveal the name of the character behind a bar
  text("Show name", width*0.85+20, height*0.3+25);
}

void mousePressed() {
  // Button show characters
  if(rectOver(width*0.85, height*0.3, 120, 40)){
    if(showNames) {
      showNames = false;
      buttonHighlight = color(0);
    }
    else {
      showNames = true;
      buttonHighlight = color(128,128,128);
    }
  }
  // Button score
  
}

boolean rectOver(float x, float y, float w, float h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    return true;
  } 
  else {
    return false;
  }  
}

class Bar {
  color barColor;
  float xBar;
  float barHeight;
  String name;
  float score;
  
  Bar(float x, float h, String n, float s) {
    barColor = 0;
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
  
  void displayName() {
    if (barOver(xBar, height*0.8, barWidth, barHeight)) {
      barColor = color(128,128,128);
      fill(128,128,128);
      scoreLine();
      text(name, width*0.85-180, height*0.8-barHeight-10);
    }
    else {
      barColor = color(0);
    }
  }
  
  void scoreLine() {
    strokeWeight(2);
    stroke(128,128,128);
    line(width*0.1-90, height*0.8-barHeight+1, width*0.85, height*0.8-barHeight+1);
    text(score, width*0.1-90, height*0.8-barHeight-10);
  }
}

/*
void showScores() {


}*/
