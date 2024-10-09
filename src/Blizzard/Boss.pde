// Emil Gruenwald

class Boss {
  // Member Variables
  PImage sprite;
  int health, damage, speed;
  char fear;

  // Constructor
  Boss () {
    health = 10;
    damage = 10;
    speed = 10;
    fear = 's';
    sprite = loadImage("");
  }

  // Member Methods
  void display() {
    image(sprite, 0, 0);
  }

  void attack() {
  }
}
