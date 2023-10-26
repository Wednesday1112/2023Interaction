float ghostX = 400, ghostY = 20;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  ellipse(200, 200, 15, 15); //主角
  if(mousePressed) line(mouseX, mouseY, pmouseX, pmouseY);
  ellipse(ghostX, ghostY, 15, 15); //鬼
  float dx = 200 - ghostX, dy = 200 - ghostY, len = sqrt(dx*dx + dy*dy);
  ghostX += dx / len / 3; //鬼的X往主角靠近
  ghostY += dy / len / 3; //鬼的Y往主角靠近
}

void mouseReleased() { //滑鼠放開時執行
  background(255);
}
