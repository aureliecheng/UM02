int nbBalls = 20;
int minDistance = 90;
Ball[] balls = new Ball[nbBalls];

void setup() {
  size(500,600);
  for(int i=0 ; i<nbBalls ; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(255,250,250);
  
  for(int i=0 ; i<nbBalls ; i++) {
    balls[i].bounce();
    balls[i].display();
    // collect all balls with the mouse when its pressed
    balls[i].collect();
  }
  
  for (int i=0 ; i<nbBalls-1 ; i++) {
    for(int j=i+1 ; j<nbBalls ; j++) {
      balls[i].link(balls[j]);
    }
  }
}

class Ball {
  float posX, posY;
  float diam;
  float speedX, speedY;
  float r, g, b;
  
  Ball() {
    posX = random(width);
    posY = random(height);
    diam = 50;
    speedX = random(1,3);
    speedY = random(1,3);
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
  }
  
  void link(Ball b2) {
    strokeWeight(10);
    stroke(126);
    // distance between two balls
    if(dist(posX, posY, b2.posX, b2.posY) < minDistance) {
      line(posX, posY, b2.posX, b2.posY);
    }
  }

  void collect() {
    if(mousePressed == true) {
      if(dist(mouseX, mouseY, posX, posY) < 60) {
      posX = mouseX;
      posY = mouseY;
      }
    }
  }
  
  void display() {
    noStroke();
    fill(r,g,b,140);
    circle(posX,posY,diam);
  }
}
