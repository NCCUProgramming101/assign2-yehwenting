//You should implement your assign2 here.
final int gameStart = 1;
final int gameRun = 2;
final int gameOver = 3;

PImage backgroundImg1;
PImage backgroundImg2;
PImage end1;
PImage end2;
PImage fighter;
PImage treasure;
PImage hp;
PImage enemy;
PImage start1;
PImage start2;

int state = gameStart;

int x,y;
//fighter
int fighterX,fighterY;
float speed ;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
//treasure
int treasureX,treasureY;
//HP
int hpX;
//enemy
int enemyX,enemyY;
void setup () {
  size(640, 480) ;
  backgroundImg1 = loadImage("img/bg1.png");
  backgroundImg2 = loadImage("img/bg2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  fighter = loadImage("img/fighter.png");
  treasure = loadImage("img/treasure.png");
  hp = loadImage("img/hp.png");
  enemy = loadImage("img/enemy.png");
  start1 = loadImage("img/start1.png");
  start2= loadImage("img/start2.png");
  
  //background
  x = -640;
  y = 0;
  //fighter
  speed = 5;
  fighterX = 570;
  fighterY = 240;
  //treasure
  treasureX = floor(random(600));
  treasureY = floor(random(400));
  //hp
  hpX = 40;
  //enemy
  enemyX = 0;
  enemyY = floor(random(480));
}
  

void draw() {
  switch(state){
    case gameStart :
    
    image(start2,0,0,640,480);
    if(mouseX> 210 && mouseX< 440 && mouseY > 370 && mouseY< 410){
      image(start1,0,0,640,480);
    }
    
    break;
    
    case gameRun:
   
    // background
    image(backgroundImg1,x,0,640,480);
    image(backgroundImg2,y,0,640,480);
    x++;
    y++;
    if(y==640){
      y=-640;
    }
    if(x==640){
      x=-640;
    }
    
      //fighter
    
    if (upPressed) {
      fighterY -= speed;
    }
    if (downPressed) {
      fighterY += speed;
    }
    if (leftPressed) {
      fighterX -= speed;
    }
    if (rightPressed) {
      fighterX += speed;
    }
    image(fighter,fighterX,fighterY);
    
    //boundary detection
    if(fighterX < 0){
      fighterX = 0;
    }
    if(fighterX > width-51){
      fighterX = width-51;
    }
    if(fighterY < 0){
      fighterY = 0;
    }
    if(fighterY > 480-51){
      fighterY = 429;
    }

       
    
    //treasure
    image(treasure,treasureX,treasureY);
    if(fighterX+51 >treasureX && fighterX-41<treasureX && fighterY+51 >treasureY && fighterY-41<treasureY){
      treasureX = floor(random(600));
      treasureY = floor(random(400));
      hpX +=20;
    }
    
    //hp
    if(hpX>=200){
        hpX = 200;
      }
    fill(255,0,0);
    rect(15,13,hpX,20);
    image(hp,10,10);
    
    
    //enemy
    image(enemy,enemyX,enemyY);
    enemyX += 5;
    if(enemyX>=640){
      enemyX=-61;
     
    }
    if(enemyY<fighterY){
      enemyY += (fighterY-enemyY)/20; 
    }
    
    if(enemyY>fighterY){
      enemyY -= (enemyY-fighterY)/20; 
    }
    if(fighterX+51 >enemyX && fighterX-61<enemyX && fighterY+51 >enemyY && fighterY-61<enemyY){
      enemyX = 0;
      enemyY = floor(random(420));
      hpX -=40;
    }
    if(hpX<=0){
      state = 3;
      
    }
   break;
   
   case gameOver:
   image(end2,0,0,640,480);
    if(mouseX> 210 && mouseX< 440 && mouseY > 310 && mouseY< 350){
      image(end1,0,0,640,480);
    if (mousePressed == true) {    
      state= gameRun;
      //fighter
      speed = 5;
      fighterX = 570;
      fighterY = 240;
      //treasure
      treasureX = floor(random(640));
      treasureY = floor(random(480));
      //hp
      hpX = 40;
      //enemy
      enemyX = 0;
      enemyY = floor(random(480));
      }
    }
     
    break;
   
  }
}
void mousePressed(){
  if(mouseX> 210 && mouseX< 440 && mouseY > 370 && mouseY< 410){
  state = gameRun; 
  }
  
}

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
