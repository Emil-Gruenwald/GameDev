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
PImage[] tileSprites = new PImage[5];
ArrayList<PVector> tiles = new ArrayList<PVector>();

int level;
boolean play;

PImage startScreen;

void setup() {
  fullScreen();
  noStroke();
  background(0);
  textFont(createFont("pixel.ttf", 32));
  textAlign(LEFT, TOP);
  boss = new Boss();
  player = new Player("Joe");
  enemy = new Enemy();
  party = new PartyMember("Bob");
  storm = new Storm();
  play = false;
  camX = 5000;
  camY = 5000;
  tileSize = 64;
  //tileSprites[0] = loadImage("dirtTileColeNeves.png");
  //tileSprites[1] = loadImage("dirtTileColeNeves(G).png");
  tileSprites[0] = loadImage("dirtTileColeNeves(S).png");
  tileSprites[1] = loadImage("dirtTileEmilGruenwald(M).png");
  tileSprites[2] = loadImage("dirtTileEmilGruenwald(H).png");
  tileSprites[3] = loadImage("rocktile1ElliottMaw.png");
  tileSprites[4] = loadImage("rocktile2ElliottMaw.png");

  for (int x = 0; x < 6400; x += tileSize) {
    for (int y = 0; y < 6400; y += tileSize) {
      tiles.add(new PVector(x, y, floor(random(3))));
      if (x == 5120 && y == 5120) {
        tiles.get(tiles.size()-1).z = 3;
      }
    }
  }

  startScreen = loadImage("StartScreenColeN.png");
  startScreen.resize(width, height);
}

void draw() {
  if (play) {
    background(150);

    //for (int x = camX - (camX % tileSize); x < camX + width + (camX % tileSize); x += tileSize) {
    //  for (int y = camY - (camY % tileSize); y < camY + height + (camY % tileSize); y += tileSize) {
    //    int drawX = x - camX;
    //    int drawY = y - camY;
    //    image(tileSprites[0], drawX, drawY);
    //  }
    //}

    for (int i = 0; i < tiles.size(); i ++) {
      image(tileSprites[floor(tiles.get(i).z)], tiles.get(i).x-camX, tiles.get(i).y-camY);
    }

    player.move(moveKeys);

    camX = player.x - (width/2);
    camY = player.y - (height/2);

    player.display(camX, camY);
    
    fill(0);
    //rect(player.x-camX, player.y-camY + 64, 64, 64);

    storm.update(0, 0);
    storm.display();
    
    hud();
  } else {
    startScreen();
  }
}

void hud () {
  fill(#D6B69B, 230);
  rect (10,10,320,80);
  fill(0);
  textSize(32);
  text("Health:", 20, 20);
  text("Temperature:", 20, 52);
  
  fill(0,255,0);
  rect (120, 20, player.health * 2, 20);
  
  fill(#9DFDFF);
  rect(205, 52, player.cold * 10, 20);
}

void startScreen() {
  image(startScreen, 0, 0);
  //background(0);
  //fill(255);
  //textAlign(CENTER);
  //textSize(50);
  //text("Press Space", width/2, height/2);
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
