class Info {
  
  String data;
  String info;
  
  PVector location;
  PVector dimen;
  
  PFont dataFont;
  PFont infoFont;
  
  TestiInfo myInfo;
  
  Info() {
    data = "19 settembre";
    info = "anticiclone africano invade l'Italia. Salvini: Altro che ruspe, VENTILATORIIIII!";
    location = new PVector(0, 0);
    dimen = new PVector(400, 200);
    
    dataFont = loadFont("Roboto-Bold-24.vlw");
    infoFont = loadFont("Roboto-Light-24.vlw");
    
    myInfo = new TestiInfo(location.x, location.y, dimen.x, dimen.y, 24, data + "\n" + info);
  }
  
  void display(PVector loc) {
    location = loc;

    pushMatrix();
    translate(location.x, location.y);
    fill(0);
    stroke(#06171e);
    strokeWeight(3);
    rectMode(CORNER);
    rect(0, 0, dimen.x, dimen.y);
    myInfo.scroll();
    myInfo.display(location);
    popMatrix();
  }
  
  void move(PVector newLocation) {
    location = newLocation;
  }
}
