// Emil Gruenwald

class Object {
  // Member Variables
  int x, y, heal, damage, coldProtection;
  PImage sprite;
  char type;

  // Constructor
  Object () {
    heal = 10;
    damage = 5;
    coldProtection = 20;
    sprite = loadImage("Torch.png");
  }

  // Member Methods
  void display () {
    image(sprite, width/2,height/2);
  }

  void use (PartyMember p) {
  }
}
