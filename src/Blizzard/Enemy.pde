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
   sprite = loadImage("");
    
  }

// Member Methods

  void display() {}
  
  void move() {}
  
  void attack() {}
} 
