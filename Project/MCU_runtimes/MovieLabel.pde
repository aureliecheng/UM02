class MovieLabel {
  float xPos = width*0.2;
  float yPos;
  String label;
  
  MovieLabel(float y, String name) {
    yPos = y;
    label = name;
  }
  
  void displayName() {
    textSize(20);
    fill(255);
    text(label, xPos, yPos);
  }
}
