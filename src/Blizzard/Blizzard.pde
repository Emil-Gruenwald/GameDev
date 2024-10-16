// Emil Gruenwald

Storm storm;
Boss boss;
// Enemy[] enemies = new Enemy[10];
// PartyMember[] party = new PartyMember[5];
Player player;
PartyMember party;
Enemy enemy;

void setup() {
  fullScreen();
  boss = new Boss();
  player = new Player("Joe");
  enemy = new Enemy();
  party = new PartyMember("Bob");
}

void draw() {
  boss.display();
  player.display();
  enemy.display();
  party.display();
  player.inventory.get(0).display();
}

void keyPressed() {
}

void mousePressed() {
}
