class Ground{
  
  int groundHeight;
  int screenY;
  boolean[][] floorDrops;
  int floorDropsDepth;
  color dropColor;
  ArrayList<Point> dropsToDraw;
  boolean drawGround;
 
  Ground(int groundHeight, int screenY, int screenX){
    this.groundHeight = groundHeight;
    this.screenY = screenY;
    floorDropsDepth = screenY - groundHeight;
    floorDrops = new boolean[screenX][floorDropsDepth]; 
    dropsToDraw = new ArrayList<Point>();
    drawGround = true;
    
  }
  
  void addDrop(Drop d) {
    dropColor = d.dropColour;
    for(int depthLevel = 0; depthLevel < floorDropsDepth; depthLevel++){
      if(!floorDrops[d.x][depthLevel]){
        floorDrops[d.x][depthLevel] = true;
        dropsToDraw.add(new Point(d.x, depthLevel));
        break;
      }
    }    
  }

  void display() {
    //render the ground
    if(drawGround){
      fill(#55BB00);
      rect(0, groundHeight, screenX, screenY - groundHeight);
      drawGround = false;
    }    
    
    //render any gathered drops
    fill(dropColor);
    
    /*
    for(int i = 0; i < screenX; i++){
      for(int j = 0; j < floorDropsDepth; j++){
        if(floorDrops[i][j]){
          rect(i, groundHeight + j, 1, 1);
         }
      }
    }
    */
    
    for(Point p : dropsToDraw){
     
      rect(p.x, groundHeight + p.y, 1, 1);
      
    }
    
    dropsToDraw.clear();
    
  } 
}