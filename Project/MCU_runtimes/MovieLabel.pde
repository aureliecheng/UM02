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
  int total = 0;
  
  MovieLabel(float x, float y, String name, color c, boolean f, int r) {
    xPos = x;
    yPos = y;
    label = name;
    currentColor = c;
    isClicked = f;
    runtime = r;
  }
  
  boolean labelOver(float mouseX, float mouseY) {
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
    if (labelOver(mouseX, mouseY) || isClicked) {
      currentColor = selectColor;
    }
    else {
      currentColor = defaultColor;
    }
    fill(currentColor);
    text(label, xPos, yPos);
  }
}
