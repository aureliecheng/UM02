class Data {
  Table table;
  StringList inventoryMoviesName;
  IntList inventoryRuntimes;
  float maxNameWidth = -1;
  int dataLength;
  int runtimeMax = -1;
  MovieLabel[] movieLabel;
  Bars[] bars;
  float space = 25;
  
  void loadData() {
    String movie;
    int runtime;
    table = loadTable("MCU_runtimes2.csv", "header");
    
    // CONDITION ORDRE TO DO
    table.sort("Chronological_order");
    
    inventoryMoviesName = new StringList();
    inventoryRuntimes = new IntList();
    
    for(TableRow row : table.rows()) {
      movie = row.getString("Movie");
      runtime = row.getInt("Runtime_min");
      inventoryMoviesName.append(movie);
      inventoryRuntimes.append(runtime);
      // Get the length of the longest movie's name
      if(textWidth(movie) > maxNameWidth) {
        maxNameWidth = textWidth(movie);
        
      }
      if(runtime > runtimeMax) {
        runtimeMax = runtime;
      }
    }
    print(inventoryMoviesName);
    print(inventoryRuntimes);
    dataLength = inventoryMoviesName.size();
    movieLabel = new MovieLabel[dataLength];
    bars = new Bars[dataLength];
    createMoviesLabels();
    createBars();
  }
  
  void createMoviesLabels() {
    float y = height*0.2;
    String name;
    for(int i=0; i<inventoryMoviesName.size(); i++) {
      name = inventoryMoviesName.get(i);
      movieLabel[i] = new MovieLabel(y, name);
      y = y + space;
    }
  }
  
  void createBars() {
    int runtime;
    float x = width*0.2 + maxNameWidth + 10;
    float y = height*0.2;
    for(int i=0; i<inventoryRuntimes.size(); i++) {
      runtime = inventoryRuntimes.get(i);
      bars[i] = new Bars(x, y, runtime);
      y = y + space;
    }
  }
}
