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
  strokeWeight(1);
  stroke(0);
  ellipse(200, 200, 15, 15);
  ellipse(ghostX, ghostY, 15, 15);
  strokeWeight(4);
  float dpx = 0, dpy = 0;
  float rightdown = 0, rightup = 0;
  boolean green_part1 = false, green_ok = false; //用來判斷左上右下跟整體是否為勾勾
  for(int i = 0; i < pt.size() - 1; i++) {
    PVector p = pt.get(i), p2 = pt.get(i + 1);
    dpx += abs(p2.x - p.x);
    dpy += abs(p2.y - p.y);
    if(p2.x - p.x > 0 && p2.y - p.y > 0) rightdown += sqrt(dpx*dpx + dpy*dpy);
    if(p2.x - p.x > 0 && p2.y - p.y < 0) rightup += sqrt(dpx*dpx + dpy*dpy); //左下右上
    ellipse(p.x, p.y, 10, 10);
    if(green_part1 == false && rightdown > 150) green_part1 = true; //左上右下
    else if(green_part1 == true && rightup > 150) green_ok = true; //勾勾
  }
  if(dpx > 100 && dpy < 40) stroke(255, 0, 0);
  else if(dpx < 40 && dpy > 100) stroke(0, 0, 255);
  else if(green_ok) stroke(0, 255, 0); //是勾勾就變綠色
  else stroke(0);
  for(int i = 0; i < pt.size() - 1; i++) {
    PVector p = pt.get(i), p2 = pt.get(i+1);
    line(p.x, p.y, p2.x, p2.y);
  }
  float dx = 200 - ghostX, dy = 200 - ghostY, len = sqrt(dx*dx + dy*dy);
  ghostX += dx / len / 3;
  ghostY += dy / len / 3;
}

void mouseReleased() {
  for(int i = pt.size()-1; i >= 0 ; i--) {
    pt.remove(i);
  }
}
