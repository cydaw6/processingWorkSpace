public class World{
  
  ArrayList<Mover> moverList;
  
  
  public World(){
    moverList = new ArrayList<Mover>();
  }
  
  public void addMovers(){
    Collections.addAll(moverList, createMovers(int(random(1,1000))));
  }
  
  public void addMovers(int number){
    Collections.addAll(moverList, createMovers(number));
  }
  
  
  
  public void draw(){
    
    
    if(!moverList.isEmpty()){
      for(Mover m: moverList){
        PVector gravity = new PVector(width/2, height/2);
        gravity.sub(m.location);
        gravity.setMag(0.5);
        m.applyForce(gravity);
        if(mousePressed){
          PVector mouse = new PVector(mouseX, mouseY);
          mouse.sub(m.location);
          mouse.setMag(0.5);
          m.acceleration = (mouse);
        }
        m.update();
        m.edges();
        m.draw();
      }
    } 
  }
  
}
