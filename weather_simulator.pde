int screenX, screenY;

Ground ground;
Sky sky;
int groundHeight;
Drop[] drops;
int removeDropCountdown;
DropType currentDropType;

//Colours
public static final int[] COLOUR_RAIN = {0,50,200};
public static final int[] COLOUR_SNOW = {220,220,255};

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
  
  currentDropType = DropType.SNOW;

  noStroke();
  
  //Initialise drops
  int numOfDrops = 2000;
  int closeDrops = (int) (numOfDrops * 0.1);
  int midRangeDrops = (int) (numOfDrops * 0.75);
  drops = new Drop[numOfDrops];
  for (int i = 0; i < numOfDrops; i++) {
    int zLevel = 1;
      if(i < closeDrops){
        zLevel = 3;
      } else if (i < midRangeDrops){
        zLevel = 2;
      }
      if(currentDropType == DropType.SNOW){
        drops[i] = new Snowdrop(screenX, screenY, zLevel, groundHeight, ground);
      } else{
          drops[i] = new Raindrop(screenX, screenY, zLevel, groundHeight, ground);
      }
  }
  
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