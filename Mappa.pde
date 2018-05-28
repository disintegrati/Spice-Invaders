import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;

public class Mappa {

  public PApplet app;

  public PVector pos;
  public PVector dimen;

  public PVector newPos;
  public PVector direction;
  public PVector velocity;

  int fiducialDimen;

  public UnfoldingMap map;

  Mappa(PVector pos_, PVector dimen_, PVector newPos_, PVector direction_, PVector velocity_, int w, int h, int fiducialDimen_, PApplet app_) {
    pos = pos_;
    dimen = dimen_;
    newPos = newPos_;
    direction = direction_;
    velocity = velocity_;

    app = app_;

    fiducialDimen = fiducialDimen_;

    String str = sketchPath("data/map3.mbtiles");
    map = new UnfoldingMap(app, 0, 0, dimen.x, dimen.y, new MBTilesMapProvider(str));
    MapUtils.createDefaultEventDispatcher(app, map);
    map.setZoomRange(3, 8);
    map.setTweening(true);
  }

  void update(PVector newp, PVector mapLocation) {
    if (frameCount % 5 == 0) map.zoomAndPanTo(new Location(mapLocation.x, mapLocation.y), int(mapLocation.z));
    newPos = newp;
    direction = PVector.sub(newPos, pos);
    velocity = PVector.div(direction, 5);
    pos.add(velocity);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    translate(fiducialDimen/2, 0);
    tint(255, 150);
    map.draw();
    popMatrix();
  }
}
