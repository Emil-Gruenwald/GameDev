// Emil Gruenwald

class Enemy {
  // Member Variables
  PImage sprite;
  int health, damage, speed, x, y;

  // Constructor
  Enemy (int x, int y) {
    this.x = x;
    this.y = y;
    health = 0;
    damage = 0;
    speed = 0;
    sprite = loadImage("edgarsSlimeGuy.png");
  }

  // Member Methods
  void display(int camX, int camY) {
    image(sprite, x - camX, y - camY);
  }

  void move() {
  }

  void attack() {
  }
}
