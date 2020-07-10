public class Scene
{
    public HashMap<Integer, Rectangle> roots;
    
    public Scene(){
      roots = new HashMap<Integer, Rectangle>();
      for(int i = 0; i < nRoots; i++){
        int[] c = {int(random(256)), int(random(256)), int(random(256)), int(random(25,90))};
        if(int(random(1)) == 1)
        {
          roots.put(i, new RectA(int(random(width)),int(random(height)), c));
        }else{
          roots.put(i, new RectB(int(random(width)),int(random(height)), c));
        }
      }
    }
}

public class Rectangle
{
  private int x, y;
  private int largeur, hauteur;
  private String type;
  private int[] colour;

  public Rectangle(int x, int y,int largeur, int hauteur, String type, int[] colour)
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
    fill(colour[0], colour[1], colour[2], colour[3]);    
    rect(x,y,largeur,hauteur);
  }
  
  public void changeColor(){
    colour[0] = colour[0] + colorIncrement * ((int(random(1)) == 0) ? 1 : 1);
    colour[1] = colour[1] + colorIncrement * ((int(random(1)) == 0) ? 1 : 1);
    colour[2] = colour[2] + colorIncrement * ((int(random(1)) == 0) ? 1 : 1);
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
    public RectA(int x, int y, int[] c){
      super(x,y,globalL,globalH,"A", c);
    }
}

public class RectB extends Rectangle
{
    public RectB(int x, int y, int[] c){
      super(x,y,globalH,globalL,"B", c);
    }
}
