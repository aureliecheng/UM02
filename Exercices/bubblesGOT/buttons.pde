class Buttons {
  String familyName;
  float xPos, yPos, rectWidth, rectHeight;
  color currentColor;
  color defaultColor = #a5abaf;
  boolean isClicked;
  
  Buttons(String name, float x, float y, float w, float h, color c) {
    familyName = name;
    xPos = x;
    yPos = y;
    rectWidth = w; 
    rectHeight = h;
    currentColor = c;
    isClicked = false;
  }
  
  void selectButton() {
    if(buttonOver()){
      isClicked = !isClicked;
    }
  }
  
  void displayButtons() {
    if (buttonOver() || isClicked) {
      currentColor = getColor(familyName);
    }
    else {
      currentColor = defaultColor;
    }
    stroke(currentColor);
    fill(currentColor);
    rect(xPos, yPos, rectWidth, rectHeight);
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text(familyName, xPos+rectWidth/2, yPos+rectHeight/2);
  }
  
  boolean buttonOver(){
    if (mouseX >= xPos && mouseX <= xPos+rectWidth && mouseY >= yPos && mouseY <= yPos+rectHeight) {
      return true;
    } 
    else {
      return false;
    }  
  }
}
