class MovieLabel {
  float xPos;
  float yPos;
  String label;
  color selectColor = color(122, 118, 142);
  color defaultColor = color(255);
  color currentColor;
  float startGraphX = data.startGraphX;
  boolean isClicked;
  int runtime;
  
  MovieLabel(float x, float y, String name, color c, int r) {
    xPos = x;
    yPos = y;
    label = name;
    currentColor = c;
    isClicked = false;
    runtime = r;
  }
  
  boolean labelOver() {
    if (mouseX >= xPos-textWidth(label) && mouseX <= xPos && mouseY >= yPos && mouseY <= yPos+20) {
      return true;
    } 
    else {
      return false;
    }  
  }
  
  void displayName() {
    textAlign(RIGHT, CENTER);
    textSize(20);
    if (labelOver() || isClicked) {
      currentColor = selectColor;
    }
    else {
      currentColor = defaultColor;
    }
    fill(currentColor);
    text(label, xPos, yPos);
  }
}
