// Emil Gruenwald

Storm storm;
Boss boss;
// Enemy[] enemies = new Enemy[10];
// PartyMember[] party = new PartyMember[5];
Player player;
PartyMember party;
Enemy enemy;

boolean play;

void setup() {
  fullScreen();
  boss = new Boss();
  player = new Player("Joe");
  enemy = new Enemy();
  party = new PartyMember("Bob");
  play = false;
}

void draw() {
  if (play) {
    background(200);
    boss.display();
    player.display();
    enemy.display();
    party.display();
    player.inventory.get(0).display();
  } else {
    startScreen();
  }
}

void keyPressed() {
  if (key == ' ') {
    play = true;
  }
}

void mousePressed() {
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Press Space", width/2, height/2);
}
