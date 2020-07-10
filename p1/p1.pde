

final int globalL = 10;
final int globalH = 5;
final int nRoots = 2;
final int rectangleIncrement = 1;
final int baseFPS = 10000;
final boolean clearAtLoop = false;
final int colorIncrement = 1;

Scene scene; 
color[] colors = new color[4];


void setup()
{
    size(1000,1000);
    background(0);
    scene = new Scene();
    frameRate(baseFPS);
    /*
    if(globalL == globalH){
      print("weight and height variable must\'nt be equals");
      noLoop();
    }
    */
}

void draw()
{
  if(clearAtLoop == true)
  {
    background(0);
  }
  
  for(int i = 0; i < rectangleIncrement; i++)
  {
    for(int j = 0; j < nRoots; j++)
    {
      createRectR(scene.roots.get(j), j).draw();
    }
  }
  
  if(keyPressed)
  {
    if(key == 'f')
    {
      frameRate(10000);
    }
    else if(key == 'r')
    {
      setup();
    }
    else if(key == 'c')
    {
     for(int j = 0; j < nRoots; j++)
      {
        scene.roots.get(j).changeColor();
      }
    }
    else if(key == 's')
    {
      saveFrame("Screenshots/line-######.png");
    }
  }
  else
  {
   frameRate(baseFPS);
  }
  
}

Rectangle createRectR(Rectangle pR, int i){
    int nx = pR.x, ny = pR.y;
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
      switch(int(random(4))){
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
      r = new RectB(nx, ny, pR.colour);
      scene.roots.replace(i, pR, r);
      return r;
    }
    r = new RectA(nx, ny, pR.colour);
    scene.roots.replace(i, pR, r);
    return r;
    
}
