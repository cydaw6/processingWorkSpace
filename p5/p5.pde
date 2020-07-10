import java.util.Collections;

World world;




void setup(){
  size(1000,1000);
  frameRate(60);
  world = new World();
  world.addMovers(500);
}

void draw(){
  background(0);
  world.draw();
  if(keyPressed){
   if(key == 'f'){
    frameRate(1000);
   }else{
     frameRate(60);
   }
  }
}
