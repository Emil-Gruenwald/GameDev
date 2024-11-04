// Emil Gruenwald

class Player {
  // Member Variables
  PImage sprite;
  int health, damage, speed, cold, x, y, sx, sy;
  String name;
  ArrayList<Object> inventory = new ArrayList<Object>();

  // Constructor
  Player (String n) {
    health = 100;
    damage = 10;
    speed = 10;
    cold = 10;
    x = 1000;
    y = 1000;
    name = n;
    sprite = loadImage("Playerguy.png");
    inventory.add(new Object());
  }

  // Member Methods
  void display (int camX, int camY) {
    image(sprite, x - camX, y - camY);
  }

  void move (boolean keys[]) {
    sx = 0;
    sy = 0;
    if (keys[0]) {
      sy = -5;
    }
    if (keys[1]) {
      sx = -5;
    }
    if (keys[2]) {
      sy = 5;
    }
    if (keys[3]) {
      sx = 5;
    }
  }

  void attack () {
  }
}
