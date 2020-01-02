  class Data {
    Table table;
    StringList inventoryMoviesName;
    IntList inventoryRuntimes;
    Axes axes;
    float maxNameWidth = -1;
    int runtimeMax = -1;
    int totalRuntime = 0;
    int dataLength;
    MovieLabel[] movieLabel;
    Plot[] plot;
    // Scaling
    float startGraphX = width*0.4;
    float startGraphY = height*0.18;
    float graphWidth = width/2;
    float graphHeight = height/2;
    float space;
    // Colors
    color selectColor = color(122, 118, 142);
    color defaultColor = color(255);
    color currentColor = defaultColor;
    
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
        totalRuntime += runtime;
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
      // Scaling
      space = graphHeight/(dataLength*2)+10;
      space = space*2-10;
      // Create
      movieLabel = new MovieLabel[dataLength];
      plot = new Plot[dataLength];
      createMoviesLabels();
      createPlots();
    }
    
    void createMoviesLabels() {
      float x = startGraphX;
      float y = startGraphY;
      String name;
      int runtime;
      for(int i=0 ; i<dataLength; i++) {
        name = inventoryMoviesName.get(i);
        runtime = inventoryRuntimes.get(i);
        movieLabel[i] = new MovieLabel(x, y, name, currentColor, runtime);
        y = y + space;
      }
    }
    
    void createPlots() {
      float y = startGraphY;
      for(int i=0 ; i<dataLength ; i++) {
        float x = startGraphX+graphWidth*inventoryRuntimes.get(i)/runtimeMax-graphWidth*50/runtimeMax;
        plot[i] = new Plot(x, y, inventoryRuntimes.get(i));
        y = y + space;
      }
    }
    
  }
