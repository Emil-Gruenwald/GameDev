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
    x = 100;
    y = 100;
    name = n;
    sprite = loadImage("Playerguy.png");
    inventory.add(new Object());
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
