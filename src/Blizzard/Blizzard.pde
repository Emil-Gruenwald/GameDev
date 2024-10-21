// Emil Gruenwald

Storm storm;
Boss boss;
// Enemy[] enemies = new Enemy[10];
// PartyMember[] party = new PartyMember[5];
Player player;
PartyMember party;
Enemy enemy;

boolean[] moveKeys = new boolean[4];

boolean play;

void setup() {
  fullScreen();
  noStroke();
  boss = new Boss();
  player = new Player("Joe");
  enemy = new Enemy();
  party = new PartyMember("Bob");
  storm = new Storm();
  play = false;
}

void draw() {
  if (play) {
    background(100);
    player.move(moveKeys);
    player.display();
    storm.update();
    storm.display();
  } else {
    startScreen();
  }
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Press Space", width/2, height/2);
}

void setMovement(int k, boolean b) {
  switch (k) {
  case 'w':
    moveKeys[0] = b;
    break;
  case 'a':
    moveKeys[1] = b;
    break;
  case 's':
    moveKeys[2] = b;
    break;
  case 'd':
    moveKeys[3] = b;
    break;
   case 'W':
    moveKeys[0] = b;
    break;
  case 'A':
    moveKeys[1] = b;
    break;
  case 'S':
    moveKeys[2] = b;
    break;
  case 'D':
    moveKeys[3] = b;
    break;
  }
}

void keyPressed() {
  setMovement(key, true);
  if (key == ' ') {
    play = true;
  }
}

void keyReleased() {
  setMovement(key, false);
}
