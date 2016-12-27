class Drop{
  
  int x, y, w, h, baseSpeed, groundHeight;
  Ground ground;
  color dropColour;
  float speedFactor;
  
  Drop(int screenX, int screenY, int zLevel, int groundHeight, Ground ground){
    
    x = (int) (Math.random() * screenX);
    y =  0 - (int) (Math.random() * screenY);
    
    //zLevel 3 is closest to screen/lens, 1 is furthest away
    w = zLevel;
    baseSpeed = zLevel * 3;
    h = zLevel;
    this.groundHeight = groundHeight;
    this.ground = ground; 
  }
  
  void update() {
    y += baseSpeed * speedFactor;
    if(y > groundHeight){
      x = (int) (Math.random() * screenX);
      y =  0 - (int) (Math.random() * screenY);
      ground.addDrop(this);
    }
  }
  
  void display() {
    fill(dropColour);
    rect(x, y, w, h);
  }
  
}