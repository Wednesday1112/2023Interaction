float marioX = 50, marioY = 250, vx = 0, vy = 0;
boolean flying = false;

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
  rect(0, 260, 700, 150);
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
