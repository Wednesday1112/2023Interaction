ArrayList<PVector> pt = new ArrayList<PVector>();
float ghostX = 400, ghostY = 20;

void setup() {
  size(400, 400);
  background(255);
}

void mouseDragged() { //滑鼠拖曳時一直執行
  pt.add(new PVector(mouseX, mouseY));
}

void draw() {
  background(255);
  ellipse(200, 200, 15, 15); //主角
  for(int i = 0; i < pt.size(); i++) {
    PVector p = pt.get(i);
    ellipse(p.x, p.y, 3, 3);
  }
  ellipse(ghostX, ghostY, 15, 15); //鬼
  float dx = 200 - ghostX, dy = 200 - ghostY, len = sqrt(dx*dx + dy*dy);
  ghostX += dx / len / 3; //鬼的X往主角靠近
  ghostY += dy / len / 3; //鬼的Y往主角靠近
}

void mouseReleased() { //滑鼠放開時執行
  background(255);
}
