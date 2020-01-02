  class Characters {
    float xPos;
    float yPos;
    String name;
    color barColor = graphColor;
    
    Characters(float x, float y, String n) {
      xPos = x;
      yPos = y;
      name = n;
    }
    
    void displayName() {
      textAlign(RIGHT, CENTER);
      textSize(20);
      fill(barColor);
      text(name, xPos, yPos);
    }
  }
