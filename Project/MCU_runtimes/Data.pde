class Data {
  Table table;
  StringList inventoryMoviesName;
  IntList inventoryRuntimes;
  Axes axes;
  float maxNameWidth = -1;
  int runtimeMax = -1;
  int dataLength;
  MovieLabel[] movieLabel;
  Bars[] bars;
  // Scaling
  float startGraphX = width*0.4;
  float startGraphY = height*0.18;
  float graphWidth = width/2;
  float graphHeight = height/2;
  float barHeight;
  float space;
  float x = startGraphX+20;
  
  void loadData() {
    String movie;
    int runtime;
    table = loadTable("MCU_runtimes.csv", "header");
    table.sort("Chronological_order");
    inventoryMoviesName = new StringList();
    inventoryRuntimes = new IntList();
    for(TableRow row : table.rows()) {
      movie = row.getString("Movie");
      inventoryMoviesName.append(movie);
      runtime = row.getInt("Runtime_min");
      inventoryRuntimes.append(runtime);
    }
    inventoryMoviesName.remove(0);
    inventoryRuntimes.remove(0);
    //totalRuntime();
    dataLength = inventoryMoviesName.size();
    // Get the length of the longest movie's name
    for(int i = 0 ; i<dataLength ; i++) {
      if(textWidth(inventoryMoviesName.get(i)) > maxNameWidth) {
        maxNameWidth = textWidth(inventoryMoviesName.get(i));
      }
    }
    // Find the longest runtime
    runtimeMax = inventoryRuntimes.max();
    // Scaling
    barHeight = graphHeight/(dataLength*2)+10;
    space = barHeight*2-10;
    // Create
    movieLabel = new MovieLabel[dataLength];
    bars = new Bars[dataLength];
    createMoviesLabels();
    createBars();
  }
  
  void createMoviesLabels() {
    float x = startGraphX;
    float y = startGraphY;
    String name;
    for(int i=0 ; i<dataLength; i++) {
      name = inventoryMoviesName.get(i);
      movieLabel[i] = new MovieLabel(x, y, name);
      y = y + space;
    }
  }
  
  void createBars() {
    float barWidth;
    float y = startGraphY;
    for(int i=0 ; i<dataLength ; i++) {
      barWidth = graphWidth*inventoryRuntimes.get(i)/runtimeMax;
      bars[i] = new Bars(x, y, barWidth, barHeight, inventoryRuntimes.get(i));
      y = y + space;
    }
  }
  
  void totalRuntime() {
    int total = 0;
    for(int i=0 ; i<inventoryRuntimes.size() ; i++) {
      total += inventoryRuntimes.get(i); 
    }
    textAlign(RIGHT, TOP);
    textSize(20);
    text("TOTAL: " + total, startGraphX, height*0.95);
  }
}
