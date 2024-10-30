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
PImage[] tileSprites = new PImage[4];
ArrayList<PVector> tiles = new ArrayList<PVector>();

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
  tileSprites[0] = loadImage("dirtTileColeNeves.png");
  tileSprites[1] = loadImage("dirtile1.png");
}

void draw() {
  if (play) {
    background(150);

    for (int x = camX - (camX % tileSize); x < camX + width + (camX % tileSize); x += tileSize) {
      for (int y = camY - (camY % tileSize); y < camY + height + (camY % tileSize); y += tileSize) {
        int drawX = x - camX;
        int drawY = y - camY;
        image(tileSprites[0], drawX, drawY);
      }
    }

    player.move(moveKeys);

    camX = player.x - (width/2);
    camY = player.y - (height/2);
    
    player.display(camX, camY);
    
    storm.update(0, 0);
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
