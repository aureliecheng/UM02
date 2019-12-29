class Total {
  int total = 0;
  
  void displayTotalRuntime(int runtime) {
    total += runtime;
    textAlign(RIGHT, CENTER);
    textSize(20);
    fill(255);
    text(total, width*0.4, height*0.94);
  }

}
