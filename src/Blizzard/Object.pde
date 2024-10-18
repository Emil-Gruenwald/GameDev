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
    type = 'w';
    x = 370;
    y = 350;
  }

  // Member Methods
  void display () {
    image(sprite, x, y);
  }

  void use (PartyMember p) {
  }
}
