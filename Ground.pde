class Ground{
  
  int groundHeight;
  int screenX;
  int screenY;
  boolean[][] floorDrops;
  int floorDropsDepth;
  color dropColor;
  ArrayList<Point> dropsToDraw;
  boolean drawGround;
  float[] alphaLevels;
 
  Ground(int groundHeight, int screenY, int screenX){
    this.groundHeight = groundHeight;
    this.screenX = screenX;
    this.screenY = screenY;
    floorDropsDepth = screenY - groundHeight;
    floorDrops = new boolean[screenX][floorDropsDepth]; 
    dropsToDraw = new ArrayList<Point>();
    drawGround = true;
    alphaLevels = new float[floorDropsDepth];
    for(int i = 0; i < floorDropsDepth; i++){
     alphaLevels[i] = 255 - 2.55 * (((float)i / floorDropsDepth) * 100); 
    }
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
    
    /*
    //Renders all drops everytime - not good
    for(int i = 0; i < screenX; i++){
      for(int j = 0; j < floorDropsDepth; j++){
        if(floorDrops[i][j]){
          rect(i, groundHeight + j, 1, 1);
         }
      }
    }
    */

    for(Point p : dropsToDraw){
      //Render any gathered drops
      fill(COLOUR_RAIN[0], COLOUR_RAIN[1], COLOUR_RAIN[2], alphaLevels[p.y]);
      rect(p.x, groundHeight + p.y, 1, 1);
      
    }
    
    dropsToDraw.clear();
    
  }
  
  public void removeDropLayer(){
    println("removeDropLayer");
    for(int i = 0; i < screenX; i++){
      for(int j = 0; j < floorDropsDepth - 1; j++){
         if(floorDrops[i][j] && !floorDrops[i][j + 1]){
           floorDrops[i][j] = false;
           
           fill(#55BB00);
           rect(i, groundHeight + j, 1, 1);
           
           j = floorDropsDepth;           
         }
      } 
    }
  }
}