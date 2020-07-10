public class Color{
  
  // Hue Saturation Brightness
  private int h, s , b;
  
  public Color(){
    h = int(random(361));
    s = int(random(101));
    b = int(random(101));
  }
  
  public Color(int h, int s, int b){
   this.h = h;
   this.s = s;
   this.b = b;
  }
  
  public void setRandom(){
   h = int(random(361));
   s = int(random(101));
   b = int(random(101));
  }
  
  public void shade(){
    
  }
  
  public void tint()
  {
   h = h + tint_factor;
  }
  
  /*
  var grey =  (r + g + b) / 3;    
  var grey2 = (new_r + new_g + new_b) / 3;
  
  var dr =  grey - grey2 * 1;    
  var dg =  grey - grey2 * 1    
  var db =  grey - grey2 * 1;  
  
  tint_r = new_r + dr;    
  tint_g = new_g + dg;   
  tint_b = new_b _ db;
  */
}
