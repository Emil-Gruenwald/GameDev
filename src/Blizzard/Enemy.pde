// Emil Gruenwald

class Enemy {
  // Member Variables
  PImage sprite;
  int health, damage, speed, x, y;

  // Constructor
  Enemy () {
    x = 0;
    y = 0;
    health = 0;
    damage = 0;
    speed = 0;
    sprite = loadImage("enemy1.png");
  }

  // Member Methods
  void display() {
    image(sprite, 0, 0);
  }

  void move() {
  }

  void attack() {
  }
}
