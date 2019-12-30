Table table;
Ball[] balls;
Buttons[] buttons;
int limit = 20;
color currentColor;
color isClicked = color(205,92,92);
color notClicked = color(178,34,34);
color defaultColor = #a5abaf;
String[] familyNames = {"Lannister","Targaryen","Stark","Baratheon","Tyrell","Martell", "Snow"}; 
ArrayList<String> familySelected = new ArrayList<String>();

void setup() {
  fullScreen();
  loadData();
}

void loadData() {
  table = loadTable("GOT.csv", "header");
  // Sort the table into score order
  table.sortReverse("score");
  // Array of Ball objects = total number of rows in the CSV but here I chose the first 20 scores
  balls = new Ball[limit];
  String fam_name;
  // Iterate on the first 20 rows
  for(int i=0; i<limit; i++) {
    float score = table.getRow(i).getFloat("score");
    String name = table.getRow(i).getString("short_name");
    name = name.split(" \\(")[0];
    String[] nameA = name.split(" ");
    String first_name = nameA[0];
    fam_name = nameA[1];
    // Cas "Robert I Baratheon"
    if(nameA[1].length() == 1) {
      fam_name = nameA[2]; 
    }
    // Make a Ball object out of the data
    balls[i] = new Ball(first_name, fam_name, score*100);
  }
  buttons = new Buttons[familyNames.length];
  float heightButton = height*0.35;
  for(int i=0; i<familyNames.length; i++) {
    buttons[i] = new Buttons(familyNames[i], width*0.05, heightButton, 150, 40, defaultColor);
    heightButton += 50;
  }
  
  
}

void draw() {
  background(255);
  for(Buttons b: buttons) {
    b.displayButtons();
    if(b.buttonOver()) {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }
  }
  stroke(0);
  line(2*width*0.05+150, 0, 2*width*0.05+150, height);  
  for(Ball b: balls) {
    b.display();
    b.bounce();
  }
}

void mouseClicked(){
  for(Buttons b: buttons) {
    b.selectButton();
    if(b.isClicked) {
      familySelected.add(b.familyName);
    }
    else {
      familySelected.remove(b.familyName);
    }
  }
}

class Ball {
  float posX, posY;
  float diam;
  float speedX, speedY;
  float r, g, b;
  String first_name, fam_name;
  boolean isSelect;
  
  Ball(String first_n, String fam_n, float d) {
    posX = random(2*width*0.05+150+diam/2, width-diam/2);
    posY = random(diam/2, height-diam/2);
    diam = d;
    first_name = first_n;
    fam_name = fam_n;
    speedX = random(2,3);
    speedY = random(2,3);
  }
  
  void bounce() {
    // update position : go left/right or top/down
    posX = posX + speedX;
    posY = posY + speedY;
    // bounce : if end of the canvas change direction
    if(posX < 2*width*0.05+150+diam/2|| posX > width-diam/2) {
      speedX = speedX*-1;
    }
    if(posY > height-diam/2 || posY < diam/2) {
      speedY = speedY*-1;
    }
  }
  
  void display() {
    if(familySelected.contains(fam_name)) {
      currentColor = getColor(fam_name);
    }
    else {
      currentColor = defaultColor;
    }
    stroke(currentColor);
    fill(currentColor);
    circle(posX, posY, diam);
    fill(255);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(first_name, posX, posY-10);
    text(fam_name, posX, posY+10);
  }
}
