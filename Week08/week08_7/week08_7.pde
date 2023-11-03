float marioX = 50, marioY = 250, vx = 0, vy = 0;
boolean flying = false, stand_box = false;

void setup() {
  size(400, 400);
}

void draw() {
  background(108, 137, 255);
  marioX += vx;
  if(flying) {
    marioY += vy;
    vy += 0.98;
    if(marioY >= 250) {
      marioY = 250;
      flying = false;
    }
  }
  fill(255, 0, 0);
  ellipse(marioX, marioY, 10, 20);
  fill(229, 119, 42);
  rect(0, 260, 700, 150); //地板
  rect(200, 150, 20, 20); //方塊
  if(hitBox(200, 150, 20, 20)) {
    if(vy > 0) { //如果是在往下掉
      marioY = 150-10;
      flying = false;
      stand_box = true;
    }
    else {
      vy = 0;
      marioY = 150+20+10;
    }
  }
}

boolean hitBox(int x, int y, int w, int h) {
  if(x-7 < marioX && marioX < x+w+7 && y-10 < marioY && marioY < y+h+10 ) return true;
  else return false;
}

void keyPressed() {
  if(keyCode == RIGHT) vx = 2;
  if(keyCode == LEFT) vx = -2;
  if(keyCode == UP && flying == false) {
    vy = -20;
    flying = true;
  }
}

void keyReleased() {
  if(keyCode == RIGHT || keyCode == LEFT) vx = 0;
}