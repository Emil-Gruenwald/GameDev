// Emil Gruenwald //<>// //<>//
import processing.sound.*;

SoundFile music;

Storm storm;
Boss boss;
// Enemy[] enemies = new Enemy[10];
// PartyMember[] party = new PartyMember[5];
Player player;
PartyMember party;
Enemy enemy;

boolean[] moveKeys = new boolean[4];

int camX, camY, camXChange, camYChange, tileSize, worldHeight, worldWidth, transition, welcomeCount; 
float temp;
int[][] tiles = new int[50][50];
ArrayList<PVector> entrances = new ArrayList<PVector>();
Timer wTime;

int level;
boolean play, battle;

int[][] corners = {
  {4, 96},
  {64, 128},
  {64, 96},
  {4, 128}
};

PImage startScreen;

PImage[] tileSprites = new PImage[7];
PImage[] backgroundSprites = new PImage[4];

void setup() {
  fullScreen();
  noStroke();
  //background(0);
  textFont(createFont("pixel.ttf", 32));
  textAlign(LEFT, TOP);
  frameRate(60);
  level = 0;
  boss = new Boss();
  player = new Player("Joe");
  enemy = new Enemy(1280, 1280);
  party = new PartyMember("Bob");
  storm = new Storm();
  play = false;
  battle = false;
  camX = 83;
  camY = 533;
  tileSize = 64;
  worldHeight = 50;
  worldWidth = 50;
  transition = 120;
  music = new SoundFile(this, "background.wav");
  tileSprites[5] = loadImage("dirtTileColeNeves.png");
  tileSprites[6] = loadImage("dirtTileColeNeves(G).png");
  tileSprites[0] = loadImage("dirtTileColeNeves(S).png");
  tileSprites[1] = loadImage("dirtTileEmilGruenwald(M).png");
  tileSprites[2] = loadImage("dirtTileEmilGruenwald(H).png");
  tileSprites[3] = loadImage("dirtTileColeNeves(Rs).png");
  tileSprites[4] = loadImage("smallTreeEmilGruenwald.png");
  backgroundSprites[0] = loadImage("TreeTileColeNeves.png");
  backgroundSprites[1] = loadImage("TreeTileColeNeves(1).png");
  backgroundSprites[2] = loadImage("TreeTileColeNeves(2).png");
  backgroundSprites[3] = loadImage("TreeTileColeNeves(3).png");

  setupLevel();

  welcomeCount = 0;
  wTime = new Timer(3000);
  wTime.start();

  startScreen = loadImage("StartScreenColeN.png");
  startScreen.resize(width, height);

  music.loop();
}

void draw() {
  if (play && !battle) {
    //music.loop();
    background(150);

    for (int x = -20; x < worldWidth + 20; x ++) {
      for (int y = -20; y < worldHeight + 20; y ++) {
        int drawX = (64*x) - camX;
        int drawY = (y*64) - camY;

        if (drawX >= -256 && drawY >= -512 && drawX <= width + 256 && drawY <= height + 512) {
          if (x >= 0 && y >= 0 && x < worldWidth && y < worldHeight) {
            image(tileSprites[tiles[x][y]], drawX, drawY);
          } //else if (abs(y%6) == 0 && abs(x%4) == 0) {
          //  image(backgroundSprites[abs((x+y)%4)], drawX, drawY-64);
          //}
        }
      }
    }

    for (int i = 0; i < entrances.size(); i++) {
      fill(0);
      rect(entrances.get(i).x*64-camX, entrances.get(i).y*64-camY, tileSize, tileSize);
    }

    //for (int i = 0; i < tiles.size(); i ++) {
    //  image(tileSprites[floor(tiles.get(i).z)], tiles.get(i).x-camX, tiles.get(i).y-camY);
    //}

    // Move player and apply collision checks
    player.move(moveKeys);

    player.x += player.sx;
    checkAndResolveCollision(tiles, player, player.sx, 0);

    player.y += player.sy;
    checkAndResolveCollision(tiles, player, 0, player.sy);

    camXChange = ((player.x - (width/2) + 34)- camX)/50;
    camYChange = ((player.y - (height/2) + 64)- camY)/50;

    camX += camXChange;
    camY += camYChange;

    player.display(camX, camY);

    enemy.display(camX, camY);

    if (dist(player.x, player.y, enemy.x, enemy.y) < 50) {
      battle = true;
    }

    storm.update(-camXChange, -camYChange);
    if (level == 0) {
      storm.display();
    }

    transition = 30;

    hud();
  } else if (!battle) {
    //wTime.start();
    startScreen();
  } else {



    if (transition > 0) {
      transition --;
      fill(0);
      rect(0, height - (30-transition)*(height/30), width, height);
    } else if (transition > -30) {
      background(150);
      transition --;
      fill(0);
      rect(0, height - (30-transition)*(height/30), width, height);
    }
  }
}

void setupLevel () {

  entrances.clear();

  if (level == 0) {
    for (int x = 0; x < worldWidth; x ++) {
      for (int y = 0; y < worldHeight; y ++) {
        tiles[x][y] = floor(random(3));
        //if (x == 20 && y == 20) {
        //  tiles[x][y] = 3;
        //}
      }
    }
    tiles[20][20] = 3;
    tiles[10][10] = 3;
    tiles[10][20] = 3;
    tiles[10][15] = 3;
    tiles[20][10] = 3;
    tiles[20][15] = 3;
    tiles[15][20] = 4;
    tiles[13][17] = 3;
    tiles[20][11] = 3;

    entrances.add(new PVector(0, 0, 1));
  } else if (level == 1) {
    for (int x = 0; x < worldWidth; x ++) {
      for (int y = 0; y < worldHeight; y ++) {
        tiles[x][y] = floor(random(2)+5);
        //if (x == 20 && y == 20) {
        //  tiles[x][y] = 3;
        //}
      }
    }

    tiles[20][20] = 3;
    tiles[10][10] = 3;
    tiles[10][20] = 3;
    tiles[10][15] = 3;
    tiles[20][10] = 3;
    tiles[20][15] = 3;
    tiles[15][20] = 3;
    tiles[13][17] = 3;
    tiles[20][11] = 3;

    entrances.add(new PVector(0, 0, 0));
  } else if (level == 2) {
  } else if (level == 3) {
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
  background(150);

  fill(255);

  switch(welcomeCount) {
  case 0:
    //background(0);
    //fill(255);
    text("Its getting cold outside", 200, 200);
    break;
  case 1:
    //background(0);
    //fill(255);
    text("Whats that noise?", 200, 200);
    break;
  case 2:
    //background(0);
    //fill(255);
    text("What is that?", 200, 200);
    break;
  case 3:
    //background(0);
    //fill(255);
    text("Ahhhhhhh!", 200, 200);
    break;
  case 4:
    //background(0);
    //fill(255);
    text("Its getting cold outside", 200, 200);
    break;
  case 5:
    //background(0);
    //fill(255);
    text("Whats that noise?", 200, 200);
    break;
  case 6:
    //background(0);
    //fill(255);
    text("What is that?", 200, 200);
    break;
  case 7:
    //background(0);
    //fill(255);
    text("Ahhhhhhh!", 200, 200);
    break;
  case 8:
    //background(0);
    //fill(255);
    text("Whats that noise?", 200, 200);
    break;
  case 9:
    //background(0);
    //fill(255);
    text("What is that?", 200, 200);
    break;
  case 10:
    //background(0);
    //fill(255);
    text("Ahhhhhhh!", 200, 200);
    break;
  case 11:
    //background(0);
    //fill(255);
    text("Its getting cold outside", 200, 200);
    break;
  default:
    image(startScreen, 0, 0);
  }

  if (wTime.isFinished()) {
    if (transition > 0) {
      transition --;
      temp = (-1.0/12.0)*((transition-60.0)*(transition-60.0))+300.0;
      fill(0, temp);
      rect(0, 0, width, height);
    }
    if (transition == 60) { //<>//
      welcomeCount ++;
    }
    if (transition == 0) {
      wTime.start();
      transition = 120;
    }
  }
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
    welcomeCount = 12;
  }
}

void keyReleased() {
  setMovement(key, false);
}

// Function to check and resolve collisions
void checkAndResolveCollision(int[][] tiles, Player player, int moveX, int moveY) {
  for (int[] offset : corners) {
    int checkX = (player.x + offset[0] + moveX) / 64;
    int checkY = (player.y + offset[1] + moveY) / 64;

    if (tiles[checkX][checkY] == 3) {
      if (moveX != 0) {
        player.x -= moveX; // Undo the x movement if collision
      }
      if (moveY != 0) {
        player.y -= moveY; // Undo the y movement if collision
      }
      return; // Exit the function if collision occurs
    }
    for (int i = 0; i < entrances.size(); i++) {
      if (checkX == entrances.get(i).x && checkY == entrances.get(i).y) {
        level = floor(entrances.get(i).z);
        setupLevel();

        player.x += player.sx * - tileSize/3;
        player.y += player.sy * - tileSize/3;

        return;
      }
    }
  }
}

void mousePressed() {
  if (!play && mouseX > width * 0.31153846153 && mouseX < width - width * 0.31153846153 && mouseY > height * 0.47222222222 && mouseY < height - height * 0.3) {
    if (welcomeCount >= 12) {
      play = true;
    }
  }
}
