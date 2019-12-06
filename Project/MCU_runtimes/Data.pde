class Data {
  Table table;
  StringList inventoryMoviesName;
  IntList inventoryRuntimes;
  float maxNameWidth = -1;
  int runtimeMax = -1;
  int dataLength;
  MovieLabel[] movieLabel;
  Bars[] bars;
  // Scaling
  float startGraphX = width*0.3;
  float startGraphY = height*0.2;
  float graphWidth = width*0.8-width*0.2; // 20% margin left and right
  float graphHeight = height*0.8-height*0.2;
  float barHeight;
  float space;
  
  void loadData() {
    String movie;
    int runtime;
    table = loadTable("MCU_runtimes2.csv", "header");
    // --------------------------CONDITION ORDRE TO DO
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
    dataLength = inventoryMoviesName.size();
    // Get the length of the longest movie's name
    for(int i = 0 ; i<dataLength ; i++) {
      if(textWidth(inventoryMoviesName.get(i)) > maxNameWidth) {
        maxNameWidth = textWidth(inventoryMoviesName.get(i));
      }
    }
    // Find the longest runtime
    runtimeMax = inventoryRuntimes.max();
    barHeight = graphHeight/(dataLength*2)+10;
    space = barHeight*2-10;
    movieLabel = new MovieLabel[dataLength];
    bars = new Bars[dataLength];
    createMoviesLabels();
    createBars();
  }
  
  void createMoviesLabels() {
    float x = startGraphX;
    float y = startGraphY;
    String name;
    for(int i=0; i<inventoryMoviesName.size(); i++) {
      name = inventoryMoviesName.get(i);
      movieLabel[i] = new MovieLabel(x, y, name);
      y = y + space;
    }
  }
  
  void createBars() {
    float runtime;
    float x = startGraphX+20;
    float y = startGraphY;
    for(int i=0; i<inventoryRuntimes.size(); i++) {
      runtime = graphWidth*inventoryRuntimes.get(i)/runtimeMax;
      bars[i] = new Bars(x, y, runtime, barHeight);
      y = y + space;
    }
  }
}
