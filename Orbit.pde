// follow the mouse with laws of physics

float posX = 200, posY = 200;
float maxAcceleration = 0.5;
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
    velocityX = velocityX + maxAcceleration * (distanceX/len);
    velocityY = velocityY + maxAcceleration * (distanceY/len);
  } else {
    velocityX = 0;
    velocityY = 0;
  }
  posX = posX + velocityX;
  posY = posY + velocityY;

  
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
