
int nMover = 10;
Mover[] list;

void setup(){
  size(1000,600);
 
  background(0); frameRate(60);
  list = new Mover[nMover];
  for(int i = 0; i < nMover; i++){
    list[i] = new Mover();
  }
}


void draw(){
  background(0);
  
  for(Mover m: list){
    PVector gravity = new PVector(0,0.3);
    // On augmente la gravité pour la mass
    gravity.mult(m.mass);
    m.applyForce(gravity);
    if(mousePressed){
     m.applyForce(new PVector(0.04,0)); 
    }
    m.update();
    m.edges();
    m.display();
  }
  
}
