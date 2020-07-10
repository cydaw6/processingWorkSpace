


final int shade_factor = 2;
int tint_factor = 2;

int number_rect = 1;


/*
  Important :
   - Use the HSB/HSV color mode
*/

Color c = new Color();

void setup()
{
  size(1000,1000);
  background(0);
  colorMode(HSB, 360, 100, 100);

}


void draw()
{
  
  for(int x = 0; x <= width; x+=width/number_rect)
  {
    for(int y = 0; y < height; y+=height/number_rect)
    
    {
      //fill(c.h, c.s, c.b);
      fill(int(random(361)), int(random(101)), int(random(101)));
      rect(x, y, width/number_rect, height/number_rect);

    }

  }
  
  if(keyPressed)
  {
   if(key == 's')
   {
     setup();
     tint_factor = -2;
     c.tint();
   }else if (key == 'd'){
     tint_factor = 2;
     c.tint();
   }
    
  }
}
