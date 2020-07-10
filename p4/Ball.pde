public class Ball{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  public Ball(){
    location = new PVector(int(random(width)), int(random(height)));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = random(1,2);
    
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(6);
    acceleration.mult(0); // nettoyer l'acceleration
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void bounce(){
    if((location.x > width-mass)){
      location.x = width;
      velocity.x *= -1;
    }
    if(location.x < 0+mass){
      location.x = 0;
      velocity.x *= -1;
    }
    
     if(location.y > height-mass){
      location.y = height;
      velocity.y *= -1;
    }
    
    if(location.y < 0+mass){
      location.y = 0;
      velocity.y *= 1;
    }
    
  }
  
  void display(){
    stroke(255);
    strokeWeight(1);
    fill(127);
    ellipse(location.x, location.y, mass*10, mass*10);
  }
  
}
