// Emil Gruenwald

class Player {
  // Member Variables
  PImage sprite;
  int health, damage, speed, cold, x, y, sx, sy;
  float frame;
  String name;
  ArrayList<Object> inventory = new ArrayList<Object>();
  PImage walkSide[] = new PImage [8];
  PImage walkVert[] = new PImage [8];

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

    walkVert[0] = loadImage("Playerguy.png");
    walkVert[1] = loadImage("Playerfront2.png");
    walkVert[2] = loadImage("Playerguy.png");
    walkVert[3] = loadImage("Playerfront3.png");
    walkVert[4] = loadImage("Playerback1.png");
    walkVert[5] = loadImage("Playerback2.png");
    walkVert[6] = loadImage("Playerback1.png");
    walkVert[7] = loadImage("Playerback3.png");
  }

  // Member Methods
  void display (int camX, int camY) {
    if (sx != 0) {
      if (sx > 0) {
        image(walkSide[floor(frame)+4], x - camX, y - camY);
      } else {
        image(walkSide[floor(frame)], x - camX, y - camY);
      }
    } else if (sy != 0) {
      if (sy < 0) {
        image(walkVert[floor(frame)+4], x - camX, y - camY);
      } else {
        image(walkVert[floor(frame)], x - camX, y - camY);
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
