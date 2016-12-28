class Snowdrop extends Drop{
  
  // Contructor
  Snowdrop(int screenX, int screenY, int zLevel, int groundHeight, Ground ground) {
   super(screenX, screenY, zLevel, groundHeight, ground);
   speedFactor = 0.5f;
   dropColour = color (#ffffff);
  }  
}