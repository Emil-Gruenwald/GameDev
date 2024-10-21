// Emil Gruenwald

Storm storm;
Boss boss;
// Enemy[] enemies = new Enemy[10];
// PartyMember[] party = new PartyMember[5];
Player player;
PartyMember party;
Enemy enemy;

boolean[] moveKeys = new boolean[4];

int camX, camY, tileSize;
PImage base, obstacle;
ArrayList<PVector> obstacles = new ArrayList<PVector>();

int level;
boolean play;

void setup() {
  fullScreen();
  noStroke();
  background(0);
  boss = new Boss();
  player = new Player("Joe");
  enemy = new Enemy();
  party = new PartyMember("Bob");
  storm = new Storm();
  play = false;
  camX = 0;
  camY = 0;
  tileSize = 64;
}

void draw() {
  if (play) {
    background(0);

    for (int x = camX - tileSize; x < camX + width + tileSize; x += tileSize) {
      for (int y = camY - tileSize; y < camY + height + tileSize; y += tileSize) {
        int drawX = x - camX;
        int drawY = y - camY;
        fill((x + y) % 255);
        rect(drawX, drawY, tileSize, tileSize);
      }
    }
    player.move(moveKeys);

    camX = player.x;
    camY = player.y;

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
