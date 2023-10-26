ArrayList<PVector> pt = new ArrayList<PVector>();
float ghostX = 400, ghostY = 20;

void setup() {
  size(400, 400);
  background(255);
}

void mouseDragged() {
  pt.add(new PVector(mouseX, mouseY));
}

void draw() {
  background(255);
  ellipse(200, 200, 15, 15);
  for(int i = 0; i < pt.size() - 1; i++) { //size - 1因為下面i + 1會超過範圍
    PVector p = pt.get(i), p2 = pt.get(i + 1); //p2當最新的點
    line(p.x, p.y, p2.x, p2.y); //點變線
  }
  ellipse(ghostX, ghostY, 15, 15);
  float dx = 200 - ghostX, dy = 200 - ghostY, len = sqrt(dx*dx + dy*dy);
  ghostX += dx / len / 3;
  ghostY += dy / len / 3;
}

void mouseReleased() {
  for(int i = pt.size()-1; i >= 0 ; i--) {
    pt.remove(i);
  }
}
