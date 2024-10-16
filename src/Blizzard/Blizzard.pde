// Emil Gruenwald

Storm storm;
Boss boss;
// Enemy[] enemies = new Enemy[10];
// PartyMember[] party = new PartyMember[5];
Player player;
PartyMember party;

void setup() {
  fullScreen();
  boss = new Boss();
  player = new Player("Joe");
}

void draw() {
  boss.display();
  player.display();
  
}

void keyPressed() {
}

void mousePressed() {
}
