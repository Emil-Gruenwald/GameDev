// Emil Gruenwald

class Enemy {
  // Member Variables
  PImage sprite;
  int health, damage, speed, x, y;

  // Constructor
  Enemy () {
    x = 500;
    y = 500;
    health = 0;
    damage = 0;
    speed = 0;
    sprite = loadImage("enemy1.png");
  }

  // Member Methods
  void display() {
    image(sprite, x, y);
  }

  void move() {
  }

  void attack() {
  }
}
