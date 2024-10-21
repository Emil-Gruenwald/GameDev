// Emil Gruenwald

class Player {
  // Member Variables
  PImage sprite;
  int health, damage, speed, cold, x, y;
  String name;
  ArrayList<Object> inventory = new ArrayList<Object>();

  // Constructor
  Player (String n) {
    health = 10;
    damage = 10;
    speed = 10;
    cold = 0;
    x = 0;
    y = 0;
    name = n;
    sprite = loadImage("Playerguy.png");
    inventory.add(new Object());
  }

  // Member Methods
  void display () {
    image(sprite, 0, 0);
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
