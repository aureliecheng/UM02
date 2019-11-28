Table table;
Ball[] balls;
int limit = 20;
color currentColor;
color isClicked = color(205,92,92);
color notClicked = color(178,34,34);
color defaultColor = color(211,211,211);

void setup() {
  size(1000, 740);
  loadData();
}

void loadData() {
  table = loadTable("GOT.csv", "header");
  // Sort the table into score order
  table.sortReverse("score");
  // Array of Ball objects = total number of rows in the CSV but here I chose the first 20 scores
  balls = new Ball[limit]; 

  // Iterate on the first 20 rows
  for(int i=0; i<limit; i++) {
    float score = table.getRow(i).getFloat("score");
    String name = table.getRow(i).getString("short_name");
    // println(name + " has a score of " + score);
    // Make a Ball object out of the data
    balls[i] = new Ball(name, score*100);
  }
}

void draw() {
  background(255);
  // Display
  for(Ball b: balls) {
    b.display();
    b.bounce();
  }
  // BONUS: button to show all the characters from the House Lannister
  fill(currentColor);
  rect(30, 680, 100,40);
  fill(255);
  // TO DO : clean calcul of the text's position
  text("Lannister", 60, 700);
  textAlign(CENTER);
}

void mousePressed() {
  if(rectOver(30, 680, 100, 40)){
    if(currentColor == isClicked) {
      currentColor = notClicked;
      // change ball colours
      
    }
    else {
      currentColor = isClicked;
    }
  }
}


boolean rectOver(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }  
}

class Ball {
  float posX, posY;
  float diam;
  float speedX, speedY;
  float r, g, b;
  String name;
  
  Ball(String n, float d) {
    posX = random(width);
    posY = random(height);
    diam = d;
    name = n;
    speedX = random(1,2);
    speedY = random(1,2);
  }
  
  void bounce() {
    // update position : go left/right or top/down
    posX = posX + speedX;
    posY = posY + speedY;
    // bounce : if end of the canvas change direction
    if(posX > width-diam/2 || posX < 0) {
      speedX = speedX*-1;
    }
    if(posY > height-diam/2 || posY < 0) {
      speedY = speedY*-1;
    }
  }
  
  void display() {
    // noStroke();
    
    fill(defaultColor);
    circle(posX, posY, diam);
    fill(0);
    textAlign(CENTER);
    text(name, posX, posY);
  }
}
