
PVector mouse;
PVector center;


void setup(){
  
  
  
  size(700,700);
  background(0);
  frameRate(1000);
  
  
}

void draw(){
  
  background(255);
  translate(width/2, height/2);
  
  
  
  mouse = new PVector(mouseX, mouseY);
  center = new PVector(width/2, height/2);
  
  mouse.sub(center);
  mouse.setMag(50);
  
  
  
  
  
  stroke(0);
  strokeWeight(10);
  line(0, 0, mouse.x, mouse.y);
  
  
  
}
