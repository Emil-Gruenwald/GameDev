// Emil Gruenwald

class Player {
  // Member Variables
  PImage sprite;
  int health, damage, speed, cold, x, y;
  String name;
  ArrayList<Object> inventory = new ArrayList<Object>();

  // Constructor
  Player (String n) {
    health = 100;
    damage = 10;
    speed = 10;
    cold = 10;
    x = 1200;
    y = 1200;
    name = n;
    sprite = loadImage("Playerguy.png");
    sprite.resize(0,128);
    inventory.add(new Object());
  }

  // Member Methods
  void display (int camX, int camY) {
    image(sprite, x - camX, y - camY);
  }

  void move (boolean keys[]) {
    if (keys[0]) {
      y -= 5;
    }
    if (keys[1]) {
      x -= 5;
    }
    if (keys[2]) {
      y += 5;
    }
    if (keys[3]) {
      x += 5;
    }
  }

  void attack () {
  }
}
