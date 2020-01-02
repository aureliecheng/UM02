  Table table;
  FloatList screentimesList;
  StringList charactersList;
  int dataLength;
  float screentimeMax;
  Characters[] characters;
  Bars[] bars;
  float startGraphX, startGraphY;
  float graphWidth, graphHeight;
  float barHeight;
  float lastPosY;
  float space;
  color graphColor = #ebebeb;
  
  void setup() {
    fullScreen();
    startGraphX = width*0.35;
    startGraphY = height*0.2;
    graphWidth = width*0.4;
    graphHeight = height/2;
    loadData();
  }
  void draw() {
    background(#2b2d42);
    fill(graphColor);
    displayHeadline();
    displayTitle();
    drawAxes();
    for(int i=0; i<dataLength; i++) {
      // Characters name
      characters[i].displayName();
      // Bars
      bars[i].displayBars();
    }
  }
  
  void loadData() {
    table = loadTable("screentime.csv", "header");
    table.sortReverse("total_screentime");
    charactersList = new StringList();
    screentimesList = new FloatList();
    for(TableRow row : table.rows()) {
      String character = row.getString("Characters");
      charactersList.append(character);
      float screentime = row.getFloat("total_screentime");
      screentimesList.append(screentime);
    }
    dataLength = charactersList.size();
    screentimeMax = screentimesList.max();
    // Scale
    barHeight = graphHeight/(dataLength*2)+10;
    space = barHeight*2-10;
    
    characters = new Characters[dataLength];
    createCharactersName();
    bars = new Bars[dataLength];
    createBars();
  }
  
  void createCharactersName() {
    float y = startGraphY;
    for(int i=0 ; i<dataLength ; i++) {
      String name = charactersList.get(i);
      //float screentime = screentimesList.get(i);
      characters[i] = new Characters(startGraphX, y, name);
      y = y + space;
    }
  }
  
  void createBars() {
    float x = startGraphX+20;
    float y = startGraphY-10;
    for(int i=0 ; i<dataLength ; i++) {
      float screentime = screentimesList.get(i);
      float barWidth = screentime*graphWidth/screentimeMax;
      bars[i] = new Bars(x, y, barWidth, barHeight, screentime);
      y = y + space;
    }
    lastPosY = bars[dataLength-1].yPos;
  }
  
  void drawAxes() {
    float x = startGraphX+20;
    float y1 = startGraphY-space/2;
    float y2 = lastPosY+space;
    stroke(graphColor);
    textSize(20);
    line(x, y1, x, y2);
    line(x, y2, x+screentimeMax*graphWidth/screentimeMax+50, y2);
    text("0", x, y2+25);
    line(x+120*graphWidth/screentimeMax, y2-5, x+120*graphWidth/screentimeMax, y2+5);
    text("2", x+120*graphWidth/screentimeMax, y2+25);
    line(x+240*graphWidth/screentimeMax, y2-5, x+240*graphWidth/screentimeMax, y2+5);
    text("4", x+240*graphWidth/screentimeMax, y2+25);
    line(x+360*graphWidth/screentimeMax, y2-5, x+360*graphWidth/screentimeMax, y2+5);
    text("6", x+360*graphWidth/screentimeMax, y2+25);
    text("hours", x+screentimeMax*graphWidth/screentimeMax+75, y2+25);
  }
  
  void displayHeadline() {
    textSize(34);
    textAlign(CENTER);
    text("Who are the main Marvel characters?", width*0.5, height*0.1); 
  }
  
  void displayTitle(){
    textSize(20);
    textAlign(CENTER);
    text("MCU movie characters total screentime. Includes after credit scenes. (imdb.com)", width*0.5, height*0.1+30);
  }
