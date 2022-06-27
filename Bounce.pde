float g = 1;
float posX = 80;
float posY = 80;
float velocityX = 20;
float velocityY = -5;
float mass = 2; // kilograms
int characterWidth = 20; //half the width
int characterHeight = 40; //half the height
float resistance = 0.8; //how much relative velocity is lost with each bounce

void setup() {
  size(1080, 675);
  frameRate(60);
  rectMode(CENTER);
}

void draw() {
  background(255);
  move();
  creature();
}

void move() {
  boolean showObjectParameters = true; // change to true or false - i don't need to put it here but i did anyway and there is nothing you can do about it

  if (showObjectParameters) {
    objectParameters();
  }

  velocityY = velocityY + g;
  posX = posX + velocityX;
  posY = posY + velocityY;

  // if the y position is below the floor,
  // it teleports the object up and inverts the velocity
  // velocityX looses energy
  if (posY > height - characterHeight) {
    posY = height - characterHeight;
    velocityY = - velocityY * resistance;
    velocityX = velocityX * resistance;
  }

  // if the position x is outside of the borders, invert
  // the velocity and loose some energy.
  if (posX > width - characterWidth) {
    posX = width - characterWidth;
    velocityX = - velocityX * resistance;
  } else if (posX < characterWidth) {
    posX = characterWidth;
    velocityX = - velocityX * resistance;
  }
}

void creature() {
  stroke(0);
  fill(0);
  ellipse(posX, posY, 80, 80);
}

void objectParameters() {
  String displayVelocityX = "Velocity X = " + round(velocityX);
  String displayVelocityY = "Velocity Y = " + round(velocityY);
  String displayPosX = "Position X = " + round(posX);
  String displayPosY = "Position Y = " + round(posY);
  String displayG = "g = " + g;
  float energyK = 0.5 * mass * (pow(velocityX, 2) + pow(velocityY, 2)); 
  float objectHeight = height - posY - characterHeight;
  float energyG = mass * g * objectHeight;
  float totalEnergy = energyG + energyK;
  String displayEnergyK = "Kinetic energy = " + round(energyK) + " j";
  String displayEnergyG = "Potential energy = " + round(energyG) + " j";
  String displayEnergy = "Total energy = " + round(totalEnergy) + " j";
  String displayObjectHeight = "Object height = " + round(objectHeight) + " m";
  textSize(10);
  fill(0);
  text(displayVelocityX, 10, 15);
  text(displayVelocityY, 10, 27);
  text(displayPosX, 10, 39);
  text(displayPosY, 10, 51);
  text("Physics", 10, 75);
  text(displayObjectHeight, 10, 87);
  text(displayEnergyK, 10, 99);
  text(displayEnergyG, 10, 111);
  text(displayEnergy, 10, 123);
  text(displayG, 10, 135);
}

void mouseClicked() {
  posX = mouseX;
  posY = mouseY;
}
