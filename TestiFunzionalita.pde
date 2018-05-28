class TestiFunzionalita {
  float xpos;
  float ypos;

  float dimx;
  float dimy;

  String bigString;

  int boxHeight; // dynamic
  int textSize;
  int textLeading;

  PFont nomeFont;
  PFont funzFont;

  PVector position;
  PVector newposition;
  PVector direction;
  PVector velocity;

  PGraphics pg;

  TestiFunzionalita(float posx, float posy, float dimenx, float dimeny, int textSize_, String string_) {
    xpos = posx;
    ypos = posy;

    dimx = dimenx;
    dimy = dimeny;

    bigString = string_;

    textSize = textSize_;
    textLeading = int(1.2 * textSize);

    nomeFont = loadFont("Roboto-Bold-24.vlw");
    funzFont = loadFont("Roboto-Light-24.vlw");

    position = new PVector(0, 0);
    newposition = new PVector(0, 0);
    direction = new PVector(0, 0);
    velocity = new PVector(0, 0);

    pg = createGraphics(int(dimenx), int(dimeny), OPENGL);
  }

  void pgText() {
    boxHeight = int(textHeight(bigString, int(dimx)-4, textLeading));
    pg.beginDraw();
    pg.background(0);
    pg.rectMode(CORNER);
    pg.textAlign(CENTER, CENTER);
    pg.textSize(textSize);
    pg.textLeading(textLeading);
    pg.textFont(funzFont);
    pg.pushMatrix();
    pg.translate(0, position.y);
    pg.noFill();
    pg.rect(0, 0, dimx, boxHeight);
    pg.fill(255);
    pg.noStroke();
    pg.text(bigString, 0, 0, dimx-4, boxHeight);
    pg.popMatrix();
    pg.endDraw();
  }

  void display(PVector location) {
    pgText();
    pushMatrix();
    translate(0, 0);
    imageMode(CORNER);
    image(pg, 0, 0, dimx, dimy);
    popMatrix();
  }

  void scroll() {
    direction = PVector.sub(newposition, position);
    velocity = PVector.div(direction, 7);
    position.add(velocity);
    println(position.y);
    position.y = constrain(position.y, -boxHeight+dimy, 0);
  }

  void update(int my, int pmy) {
    float a = my-pmy;
    newposition.y += a;
  }

  // ------------------------------------------------------------------------

  public int textHeight(String inputString, int specificWidth, int leading) {
    String[] paragraphs = split(inputString, "\n");
    int numEmptyLines = 0;
    int numTextLines = 0;
    for (int i=0; i<paragraphs.length; i++) {
      if (paragraphs[i].length() == 0) {
        numEmptyLines++;
      } else {
        numTextLines++;
        String[] wordsArray = split(paragraphs[i], " ");
        String tempString = "";
        for (int k=0; k < wordsArray.length; k++) {
          if (textWidth(tempString + wordsArray[k]) < specificWidth) {
            tempString += wordsArray[k] + " ";
          } else {
            tempString = wordsArray[k] + " ";
            numTextLines++;
          }
        }
      }
    }
    return (numTextLines + numEmptyLines) * leading + (numTextLines + numEmptyLines) * textSize;
  }
}
