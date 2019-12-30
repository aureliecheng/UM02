class Total {
  int total = 0;
  
  void displayTotalRuntime(int runtime) {
    total += runtime;
    textAlign(RIGHT, CENTER);
    textSize(20);
    fill(255);
    text("TOTAL:", width*0.4, height*0.94);
    textAlign(LEFT, CENTER);
    text(total+"/"+data.totalRuntime+" min", width*0.4+10, height*0.94);
  }
}
