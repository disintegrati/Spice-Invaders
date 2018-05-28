class Pannello {
  PVector location;
  PVector newLocation;
  PVector direction;
  PVector velocity;
  
  PVector dimension;
  PVector new_dimension;
  PVector dimension_direction;
  PVector dimension_velocity;
  
  Funzionalita funzionalita;
  Info info;
  
  Pannello(PVector loc, PVector dim) {
    location = new PVector(0, 0);
    newLocation = loc;
    direction = new PVector(0, 0);
    velocity = new PVector(0, 0);
    
    dimension = new PVector(0, 0);
    new_dimension = dim;
    dimension_direction = new PVector(0, 0);
    dimension_velocity = new PVector(0, 0);
    
    funzionalita = new Funzionalita(location.x, location.y);
  }
  
  void display{
  }
