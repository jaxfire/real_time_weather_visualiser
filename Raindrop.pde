class Raindrop extends Drop{
  
  // Contructor
  Raindrop(int screenX, int screenY, int zLevel, int groundHeight, Ground ground) {
   super(screenX, screenY, zLevel, groundHeight, ground);
   speedFactor = 1.0f;
   dropColour = color (COLOUR_RAIN[0], COLOUR_RAIN[1], COLOUR_RAIN[2]);
  }  
}