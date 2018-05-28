/**
 * An application with a basic interactive map. You can zoom and pan the map.
 */

//import de.fhpotsdam.unfolding.providers.Microsoft;
//import de.fhpotsdam.unfolding.providers.Google;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;

//UnfoldingMap map;

Mappa myMap;

Info myInfo;

Funzionalita myFunz;

int fiducial_dimension = 100;

void setup() {
  size(1280, 1024, OPENGL);

  /*String str = sketchPath("data/mappina.mbtiles");
  map = new UnfoldingMap(this, new MBTilesMapProvider(str));
  MapUtils.createDefaultEventDispatcher(this, map);
  map.setZoomRange(3, 8);*/
  PVector p = new PVector(width/2, height/2);
  PVector s = new PVector(800, 400);
  PVector pp = new PVector(width/2, height/2);
  PVector pd = new PVector(0, 0);
  PVector pv = new PVector(0, 0);
  myMap = new Mappa(p, s, pp, pd, pv, width, height, fiducial_dimension, this);
  myInfo = new Info();
  myFunz = new Funzionalita();
}

void draw() {
  background(#06171e);
  
  PVector np = new PVector(0, 0+200);
  int nz = 6;
  PVector nl = new PVector(40.51, 14.14, 6);
  if (mousePressed) nl = new PVector(random(60), random(60));
  myMap.update(np, nl);
  myMap.display();
  
  np = new PVector((fiducial_dimension/2), 0);
  myInfo.display(np);
  //myInfo.move(np);
  
  np = new PVector(400+(fiducial_dimension/2), 0);
  myFunz.display(np);
  //myFunz.move(np);
  np = new PVector(0, 0);
  //myFunz.scroll();
}

void mouseDragged() {
  myFunz.move(mouseY, pmouseY);
}
