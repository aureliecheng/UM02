class Buttons {
  String familyName;
  float xPos, yPos, rectWidth, rectHeight;
  color currentColor;
  color defaultColor = #e0e2e1;
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
    fill(currentColor);
    rect(xPos, yPos, rectWidth, rectHeight);
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text(familyName, xPos+rectWidth/2, yPos+rectHeight/2);
  }
  
  color getColor(String name) {
    color famColor;
    switch(name) {
      case "Lannister":
        famColor = #930416;
        break;
      case "Targaryen":
        famColor = #000000;
        break;
      case "Stark":
        famColor = #8d8d8d;
        break;
      case "Baratheon":
        famColor = #513f3f;
        break;
      case "Tyrell":
        famColor = #9ecea4;
        break;
      case "Martell":
        famColor = #c159ad;
        break;
      default:
        famColor = #e0e2e1;
        break;
    }
    return famColor;
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
