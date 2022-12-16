PImage map;

int mapX = -200;

void setup() {
  size(1050, 650);
  smooth();
  
  map = loadImage("map.png");
}

void draw() {
  image(map, -5, -5);
}
