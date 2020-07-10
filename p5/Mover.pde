public class Mover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  public Mover(){
   location = new PVector(random(width), random(height));
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   mass = random(1,2);
  }
  
  public void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(force);
  }
  
  
  public void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.limit(4);
    acceleration.mult(-0.5);
  }
  
  public void edges(){
    if(location.x > width){
      location.x = width;
      velocity.x *= -1;
    }
    
    if(location.x < 0){
     location.x = 0;
      velocity.x *= -1;
    }
    
    if(location.y > height){
      location.y = height;
      velocity.y *= -1;
    }
    
    if(location.y < 0){
     location.y = 0;
     velocity.y *= -1;
    }
  }
  
  public void draw(){
    stroke(255);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, mass*5, mass*5);
  }
  
}
