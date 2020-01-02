  class Total {
    int total = 0;
    
    void displayTotalRuntime(int runtime) {
      total += runtime;
      textAlign(CENTER, CENTER);
      textSize(20);
      fill(255);
      text("TOTAL:  " + total + "/" + data.totalRuntime, data.startGraphX, height*0.94);
    }
  }
