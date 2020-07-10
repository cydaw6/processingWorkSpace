Objet objet;

void setup() {
  size(300, 300);
  objet = new Objet(new PVector(width/2, height/2), new PVector(0, 0),
  new PVector ( random(-1, 1), random(-1, 1) ), random(5, 10));
}

void draw() {
background(0);
 objet.draw();
}




class Objet {
  PVector pos;
  PVector vel;
  PVector acc;
  float masse;

  Objet (PVector p, PVector v, PVector a, float m) {
    pos = p.get();
    vel = v.get();
    acc = a.get();
    masse = m;
  }

  void update() {
    border();
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void draw() {
    update();
    fill(255);
    ellipse (pos.x, pos.y, masse*5, masse*5);// *5 pour le rendre un peu plus grand
  }
  void border() {
    if (pos.x <0) {
      pos.x = 0;
      vel.x*=-1;
    }
    if ( pos.x > width) {
      pos.x = width;
      vel.x*=-1;
    }
    if (pos.y <0) {
      pos.y = 0;
      vel.y*=-1;
    }
    if ( pos.y > height) {
      pos.y = height;
      vel.y*=-1;
    }
  }
}
