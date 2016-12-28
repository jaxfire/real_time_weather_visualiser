int screenX, screenY;

Ground ground;
Sky sky;
int groundHeight;
Drop[] drops;
int removeDropCountdown;

//Colours
public static final int[] COLOUR_RAIN = {0,50,200};

void settings(){
  screenX = 500;
  screenY = 500;
  groundHeight = (int) (screenY * 0.7);
  size(screenX, screenY);
}

void setup() {
  
  //Ground
  ground = new Ground(groundHeight, screenY, screenX);
  sky = new Sky(groundHeight, screenX, screenY);
  removeDropCountdown = 250;

  noStroke();
  
  //Rain
  int numOfRaindrops = 2000;
  int closeRain = (int) (numOfRaindrops * 0.1);
  int midRangeRain = (int) (numOfRaindrops * 0.55);
  drops = new Raindrop[numOfRaindrops];
  for (int i = 0; i < numOfRaindrops; i++) {
    int zLevel = 1;
      if(i < closeRain){
        zLevel = 3;
      } else if (i < midRangeRain){
        zLevel = 2;
      }
      drops[i] = new Raindrop(screenX, screenY, zLevel, groundHeight, ground);
  }
  
  /*
  //Snow
  int numOfSnowdrops = 2000;
  int closeSnow = (int) (numOfSnowdrops * 0.1);
  int midRangeSnow = (int) (numOfSnowdrops * 0.75);
  snow = new Snowdrop[numOfSnowdrops];
  for (int i = 0; i < numOfSnowdrops; i++) {
    int zLevel = 1;
      if(i < closeSnow){
        zLevel = 3;
      } else if (i < midRangeSnow){
        zLevel = 2;
      }
      snow[i] = new Snowdrop(screenX, screenY, zLevel, groundHeight, ground);
  }
  */
}

void draw(){
  
  if(removeDropCountdown <= 0){
    ground.removeDropLayer();
    removeDropCountdown = 250;
  }
  
  removeDropCountdown--;
  
  sky.renderSky();
  
  //Update and draw the snow  
  for (Drop drop : drops) {
    drop.update();
    drop.display();
  }
  
  ground.display();
 
  //println("Framerate: " + frameRate);
}