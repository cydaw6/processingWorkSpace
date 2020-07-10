 
Ball[] list;
int nball = 10;
  
void setup() {
  size(1000,800);
  frameRate(60);
  list = new Ball[nball];
  for(int i = 0; i < nball; i++){
    list[i]= new Ball();
    
  }
}

void draw() {
  
  
  
  background(0);
  for(Ball b: list){
    PVector gravity = new PVector(0,0.3);
    gravity.mult(b.mass);
    b.applyForce(gravity);
    if(mousePressed){
      PVector wind = new PVector(0.04,0);
      b.applyForce(wind);
    }
    b.update();
    b.bounce();
    b.display();
  }
}
