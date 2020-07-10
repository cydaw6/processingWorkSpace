import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class p1 extends PApplet {

Scene scene;

final int globalL = 30, globalH = 10;
final int nRoots = 3;
int[] colors = new int[4];
final int rectangleIncrement = 1;

public void setup()
{
    
    background(0);
    scene = new Scene();
    frameRate(30);
    if(globalL == globalH){
      print("weight and height variable must\'nt be equals");
      noLoop();
    }
    
    print("yes");
}

public void draw()
{


  text("Ouai", width/2, height/2);
  
  for(int i = 0; i < rectangleIncrement; i++){
    for(Rectangle r: scene.roots.keySet()){
      scene.updateRoot(r, createRectR(r, scene));
    }

  }

  if(keyPressed){
    if(key == 'f'){
      frameRate(1000);
    }
  }else{
      frameRate(30);
    }
  
}

public Rectangle createRectR(Rectangle pR, Scene scene){
    int nx = 400, ny = 400;
    int largeur, hauteur;
    if(pR.type.equals("A"))
    {
      largeur = globalH;
      hauteur = globalL;
    }else{
      largeur = globalL;
      hauteur = globalH;
    }
    boolean ok = true;
    while(ok == true){
      switch(PApplet.parseInt(random(4))){
        case 0:
          nx = pR.x+pR.largeur;
          ny = pR.y;
          break;
        case 1:
          nx = pR.x-largeur;
          ny = pR.y;
          break;
        case 2:
          nx = pR.x+pR.largeur;
          ny = (pR.y+pR.hauteur)-hauteur;
          break;
        case 3:
          nx = pR.x-largeur;
          ny = (pR.y+pR.hauteur)-hauteur;
          break;
      }
      if((nx <= width && nx >= 0) && (ny <= height && ny >= 0)){
        ok = false;
      }else{
        ok = true;
      }
    }
    Rectangle r;
    if(pR.type.equals("A"))
    {
      r = new RectB(nx, ny);
      return r;
    }
    r = new RectA(nx, ny);
    return r;
    
}
public class Scene
{
    public HashMap<Rectangle> roots;
    int c;

    public Scene(){
      roots = new HashMap<Rectangle>();
      for(int i = 0; i < nRoots; i++){
        c = color(
          PApplet.parseInt(random(255)),
        PApplet.parseInt(random(255)),
        PApplet.parseInt(random(255))
        );

        if(PApplet.parseInt(random(1)) == 1)
        {
          roots.put(new RectA(PApplet.parseInt(random(width)),PApplet.parseInt(random(height)), c));
        }else{
          roots.put(new RectB(PApplet.parseInt(random(width)),PApplet.parseInt(random(height)), c));
        }
      }

    }

    public boolean updateRoot(Rectangle r, Rectangle nr)
    {
      roots.remove(r);
      roots.put(nr);
    }
}

public class Rectangle
{
  private int x, y;
  private int largeur, hauteur;
  private String type;
  private int colour;

  public Rectangle(int x, int y,int largeur, int hauteur, String type, int colour)
  {
      this.x = x;
      this.y = y;
      this.largeur = largeur;
      this.hauteur = hauteur;
      this.type = type;
      this.colour = colour;
  }
  
  public void draw()
  {
        rect(x,y,largeur,hauteur);
  }
    
  public boolean equals(Object o)
  {
   if(!(o instanceof Rectangle))
   {
    return false; 
   }
   Rectangle r = (Rectangle) o;
   if(x == r.x && y == r.y && largeur == r.largeur && hauteur == r.hauteur){
    return true; 
   }
   return false;
  }
}

public class RectA extends Rectangle
{
    public RectA(int x, int y, Color c){
      super(x,y,globalL,globalH,"A", c);
    }
}

public class RectB extends Rectangle
{
    public RectB(int x, int y, Color c){
      super(x,y,globalH,globalL,"B", c);
    }
}
public boolean rchoice(){
        return (PApplet.parseInt(random(2)) == 0) ? true : false;
}
  public void settings() {  size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "p1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
