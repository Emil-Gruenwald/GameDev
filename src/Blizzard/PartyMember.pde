// Emil Gruenwald

class PartyMember {
  // Member Variables
  PImage sprite;
  int health, damage, speed, cold, x, y;
  String name;

  // Constructor
  PartyMember (String n) {
    x = 0;
    y = 500;
    cold = 0;
    speed = 10;
    health = 10;
    damage = 10;
    name = n;
    sprite = loadImage("axeguy.png");
  }

  // Member Methods
  void display () {
    image(sprite, x, y);
  }

  void move () {
  }

  void attack () {
  }
}
