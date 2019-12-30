color getColor(String name) {
    color famColor;
    switch(name) {
      case "Lannister":
        famColor = #930416;
        break;
      case "Targaryen":
        famColor = #000000;
        break;
      case "Stark":
        famColor = #7f7979;
        break;
      case "Baratheon":
        famColor = #513f3f;
        break;
      case "Tyrell":
        famColor = #9ecea4;
        break;
      case "Martell":
        famColor = #c159ad;
        break;
      case "Snow":
        famColor = #c1bdb3;
        break;
      default:
        famColor = #e0e2e1;
        break;
    }
    return famColor;
  }
