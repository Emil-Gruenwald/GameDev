// Emil Gruenwald

Storm storm;
Boss boss;
// Enemy[] enemies = new Enemy[10];
// PartyMember[] party = new PartyMember[5];
Player player;
PartyMember party;
Enemy enemy;

boolean[] moveKeys = new boolean[4];

int camX, camY, camXChange, camYChange, tileSize, worldHeight, worldWidth;
PImage[] tileSprites = new PImage[5];
int[][] tiles = new int[50][50];
// ArrayList<PVector> tiles = new ArrayList<PVector>();

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
  camX = 83;
  camY = 533;
  tileSize = 64;
  worldHeight = 50;
  worldWidth = 50;
  //tileSprites[0] = loadImage("dirtTileColeNeves.png");
  //tileSprites[1] = loadImage("dirtTileColeNeves(G).png");
  tileSprites[0] = loadImage("dirtTileColeNeves(S).png");
  tileSprites[1] = loadImage("dirtTileEmilGruenwald(M).png");
  tileSprites[2] = loadImage("dirtTileEmilGruenwald(H).png");
  tileSprites[3] = loadImage("rocktile1ElliottMaw.png");
  tileSprites[4] = loadImage("rocktile2ElliottMaw.png");

  for (int x = 0; x < worldWidth; x ++) {
    for (int y = 0; y < worldHeight; y ++) {
      tiles[x][y] = floor(random(3));
      if (x == 20 && y == 20) {
        tiles[x][y] = 3;
      }
    }
  }

  startScreen = loadImage("StartScreenColeN.png");
  startScreen.resize(width, height);
}

void draw() {
  if (play) {
    background(150);

    for (int x = 0; x < worldWidth; x ++) {
      for (int y = 0; y < worldHeight; y ++) {
        int drawX = (64*x) - camX;
        int drawY = (y*64) - camY;

        image(tileSprites[tiles[x][y]], drawX, drawY);
      }
    }

    //for (int i = 0; i < tiles.size(); i ++) {
    //  image(tileSprites[floor(tiles.get(i).z)], tiles.get(i).x-camX, tiles.get(i).y-camY);
    //}

    player.move(moveKeys);

    player.x += player.sx;
    if (tiles[(player.x+4)/64][(player.y + 96)/64] == 3) {
      while (tiles[(player.x+4)/64][(player.y + 96)/64] == 3) {
        player.x -= abs(player.sx)/player.sx;
      }
    }
    if (tiles[(player.x+64)/64][(player.y + 128)/64] == 3) {
      while (tiles[(player.x+64)/64][(player.y + 128)/64] == 3) {
        player.x -= abs(player.sx)/player.sx;
      }
    }
    if (tiles[(player.x+64)/64][(player.y + 96)/64] == 3) {
      while (tiles[(player.x+64)/64][(player.y + 96)/64] == 3) {
        player.x -= abs(player.sx)/player.sx;
      }
    }
    if (tiles[(player.x+4)/64][(player.y + 128)/64] == 3) {
      while (tiles[(player.x+4)/64][(player.y + 128)/64] == 3) {
        player.x -= abs(player.sx)/player.sx;
      }
    }

    player.y += player.sy;
    if (tiles[(player.x+4)/64][(player.y + 96)/64] == 3) {
      while (tiles[(player.x+4)/64][(player.y + 96)/64] == 3) {
        player.y -= abs(player.sy)/player.sy;
      }
    }
    if (tiles[(player.x+64)/64][(player.y + 128)/64] == 3) {
      while (tiles[(player.x+64)/64][(player.y + 128)/64] == 3) {
        player.y -= abs(player.sy)/player.sy;
      }
    }
    if (tiles[(player.x+64)/64][(player.y + 96)/64] == 3) {
      while (tiles[(player.x+64)/64][(player.y + 96)/64] == 3) {
        player.y -= abs(player.sy)/player.sy;
      }
    }
    if (tiles[(player.x+4)/64][(player.y + 128)/64] == 3) {
      while (tiles[(player.x+4)/64][(player.y + 128)/64] == 3) {
        player.y -= abs(player.sy)/player.sy;
      }
    }
    
    

    camXChange = ((player.x - (width/2) + 34)- camX)/50;
    camYChange = ((player.y - (height/2) + 64)- camY)/50;
    
    camX += camXChange;
    camY += camYChange;

    player.display(camX, camY);

    fill(0);
    // this is the collosion hitbox
    //rect(player.x-camX, player.y-camY + 64, 68, 64);

    storm.update(-camXChange, -camYChange);
    storm.display();

    hud(); //<>//
  } else {
    startScreen();
  }
}

void hud () {
  fill(#D6B69B, 230);
  rect (10, 10, 320, 80);
  fill(0);
  textSize(32);
  text("Health:", 20, 20);
  text("Temperature:", 20, 52);

  fill(0, 255, 0);
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
