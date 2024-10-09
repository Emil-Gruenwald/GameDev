// Emil Gruenwald

class Object {
  // Member Variables
  int heal, damage, coldProtection;
  PImage sprite;
  char type;

  // Constructor
  Object () {
    heal = 20;
    damage = 5;
    coldProtection = 10;
    sprite = loadImage("");
  }

  // Member Methods
  void display () {
  }

  void use (PartyMember p) {
  }
}
