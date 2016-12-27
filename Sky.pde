class Sky {
  
  int x, y, width, height;
 
  Sky(int groundHeight, int screenX, int screenY){
    
    x = 0;
    y = 0;
    width = screenX;
    height = groundHeight;
    
  }
  
  void renderSky(){
   
    fill(#000000);
    rect(x, y, width, height);
    
  }
  
}