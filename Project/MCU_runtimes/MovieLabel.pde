class MovieLabel {
  float xPos;
  float yPos;
  String label;
  color selectColor = color(122, 118, 142);
  color defaultColor = color(255);
  color currentColor;
  float startGraphX = data.startGraphX;
  
  MovieLabel(float x, float y, String name) {
    xPos = x;
    yPos = y;
    label = name;
    currentColor = defaultColor;
  }
  
  boolean labelOver(float x, float y, float w, float h) {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else {
      return false;
    }  
  }
  
  void clicked() {
    if (labelOver(startGraphX-textWidth(label), yPos, textWidth(label), 20)) {
      if (currentColor == selectColor) {
        currentColor = defaultColor;
      }
      else {
        currentColor = selectColor;
      }
    }
  }
 
  void displayName() {
    textAlign(RIGHT, CENTER);
    textSize(20);
    if (labelOver(xPos-textWidth(label), yPos,textWidth(label), 20)) {
      currentColor = selectColor;
    }
    else {
      currentColor = defaultColor;
    }
    fill(currentColor);
    text(label, xPos, yPos);
  }
}
