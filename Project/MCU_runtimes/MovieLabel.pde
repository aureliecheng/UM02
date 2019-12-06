class MovieLabel {
  float xPos;
  float yPos;
  String label;
  
  MovieLabel(float x, float y, String name) {
    xPos = x;
    yPos = y;
    label = name;
  }
  
  void displayName() {
    textAlign(RIGHT, TOP);
    textSize(20);
    fill(255);
    text(label, xPos, yPos);
  }
}
