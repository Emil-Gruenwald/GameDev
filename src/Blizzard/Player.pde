// Emil Gruenwald

class Player {
  // Member Variables
  PImage sprite;
  int health, damage, speed, cold, x, y, sx, sy;
  float frame;
  String name;
  ArrayList<Object> inventory = new ArrayList<Object>();
  PImage walkSide[] = new PImage [8];

  // Constructor
  Player (String n) {
    health = 100;
    damage = 10;
    speed = 10;
    cold = 10;
    x = 1000;
    y = 1000;
    name = n;
    frame = 0;
    sprite = loadImage("Playerguy.png");
    inventory.add(new Object());

    walkSide[0] = loadImage("Playerwalk-2.png");
    walkSide[1] = loadImage("Playerwalk-3.png");
    walkSide[2] = loadImage("Playerwalk-2.png");
    walkSide[3] = loadImage("Playerwalk-4.png");
    walkSide[4] = loadImage("Playerwalk-5.png");
    walkSide[5] = loadImage("Playerwalk-6.png");
    walkSide[6] = loadImage("Playerwalk-5.png");
    walkSide[7] = loadImage("Playerwalk-7.png");
  }

  // Member Methods
  void display (int camX, int camY) {
    if (sx != 0) {
      if (sx > 0) {
        image(walkSide[floor(frame)+4], x - camX, y - camY);
      } else {
        image(walkSide[floor(frame)], x - camX, y - camY);
      }
    } else {
      image(sprite, x - camX, y - camY);
    }
  }

  void move (boolean keys[]) {
    sx = 0;
    sy = 0;
    frame += 0.1;
    if (frame >= 4) {
      frame -= 4;
    }
    if (keys[0]) {
      sy = -3;
    }
    if (keys[1]) {
      sx = -3;
    }
    if (keys[2]) {
      sy = 3;
    }
    if (keys[3]) {
      sx = 3;
    }
  }

  void attack () {
  }
}
