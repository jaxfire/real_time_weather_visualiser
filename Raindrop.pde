class Raindrop extends Drop{
  
  // Contructor
  Raindrop(int screenX, int screenY, int zLevel, int groundHeight, Ground ground) {
   super(screenX, screenY, zLevel, groundHeight, ground);
   speedFactor = 1.0f;
   dropColour = color (0x99003399);
  
  }  
}