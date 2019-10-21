Table table;
Ball[] balls;
int limit = 20;

void setup() {
  size(640, 540);
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
    r = random(255);
    g = random(255);
    b = random(255);
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
  }/*
  
  void link(Ball b2) {
    strokeWeight(10);
    stroke(126);
    // distance between two balls
    if(dist(posX, posY, b2.posX, b2.posY) < minDistance) {
      line(posX, posY, b2.posX, b2.posY);
    }
  }

  void collect() {
    if(mousePressed) {
      if(dist(mouseX, mouseY, posX, posY) < 60) {
      posX = mouseX;
      posY = mouseY;
      }
    }
  }*/
  
  void display() {
    noStroke();
    fill(r,g,b,140);
    circle(posX, posY, diam);
    fill(0);
    textAlign(CENTER);
    text(name, posX, posY);
  }
}
