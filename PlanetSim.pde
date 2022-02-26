void setup() {
  size(800,800);
  frameRate(60);
  background(0);
  
  color YELLOW = color(255,255,0);
  color BLUE = color(100,149,237);
  color RED = color(188,39,50);
  color DARKGREY = color(80,78,81);
  color WHITE = color(255,255,255);
  
  Planet sun = new Planet(0, 0, 30, YELLOW, 1.98892e30);
  sun.sun = true;
  
  Planet earth = new Planet(-1*Planet.AU, 0, 16, BLUE, 5.9742e24);
  Planet mars = new Planet(-1.524*Planet.AU, 0, 12, RED, 6.39e23);
  Planet mercury = new Planet(0.387*Planet.AU, 0, 8, DARKGREY, 3.30e23);
  Planet venus = new Planet(0.723*Planet.AU, 0, 14, WHITE, 4.8685e24);
  
  Planet[] planets = {sun, earth, mars, mercury, venus};
  
  for (Planet planet : planets) {
    planet.draw();
  }
}

class Planet {
  float x;
  float y;
  float radius;
  color c;
  float mass;
  
  Planet[] orbit;
  boolean sun = false;
  float distanceToSun = 0;
  float xVel = 0;
  float yVel = 0;
  
  static final float AU = 146.6e6 * 1000;
  static final float G = 6.67428e-11;
  static final float SCALE = 250 / AU; //1AU = 100 pxls
  static final float TIMESTEP = 3600 * 24; //1 day
  
  Planet(float tempX, float tempY, float tempRadius, color tempC, float tempMass) {
    x = tempX;
    y = tempY;
    radius = tempRadius;
    c = tempC;
    mass = tempMass;
  }
  
  void draw() {
    x = this.x * SCALE + width/2;
    y = this.y * SCALE + height/2;
    fill(c);
    ellipse(x, y, this.radius, this.radius);
  }
}
