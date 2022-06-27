// follow the mouse

float posX = 200, posY = 200;
float distanceX, distanceY, angle, velocityX, velocityY;

void setup() {
  size(900, 600);
  frameRate(60);
}

void draw() {
  background(255);
  display();
}

void display() {
  fill(0);
  ellipse(posX, posY, 80, 80);
  move();
}

void move() {
  boolean boolDisplayStats = true;  //change to true or false

  float maxVelocity = 5;
  distanceX = mouseX - posX;
  distanceY = mouseY - posY;

  float len = dist(0, 0, distanceX, distanceY);
  if (len > 1 * maxVelocity) {
    velocityX = (distanceX/len) * maxVelocity;
    velocityY = (distanceY/len) * maxVelocity;
  } else {
    velocityX = 0;
    velocityY = 0;
  }
  posX = posX + velocityX;
  posY = posY + velocityY;

  if (boolDisplayStats) {
    displayStats();
  }
}

void displayStats() {
  String displayDistanceX = "Distance X = " + round(distanceX);
  String displayDistanceY = "Distance Y = " + round(distanceY);
  String displayAngle = "Angle = " + (angle) + " radians";
  float compoundVelocity = sqrt(pow(velocityX, 2) + pow(velocityY, 2));
  String displayVelocity = "velocity = " + round(compoundVelocity) + " m/s";
  textSize(10);
  fill(0);
  text(displayDistanceX, 10, 15);
  text(displayDistanceY, 10, 27);
  text(displayAngle, 10, 39);
  text(displayVelocity, 10, 51);
}
