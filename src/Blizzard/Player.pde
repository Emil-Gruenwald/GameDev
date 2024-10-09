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
    sprite = loadImage("");
  }
  
  // Member Methods
  void display () {}
  
  void move () {}
  
  void attack () {}
}
