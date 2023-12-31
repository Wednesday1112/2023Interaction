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
  float rightdown = 0, green_rightup = 0; //換成green_rightup是怕跟倒勾勾的搞混
  boolean green_part1 = false, green_ok = false;
  for(int i = 0; i < pt.size() - 1; i++) {
    PVector p = pt.get(i), p2 = pt.get(i + 1);
    dpx += abs(p2.x - p.x);
    dpy += abs(p2.y - p.y);
    if(p2.x - p.x > 0 && p2.y - p.y > 0) rightdown += sqrt(dpx*dpx + dpy*dpy);
    if(green_part1 && p2.x - p.x > 0 && p2.y - p.y < 0) green_rightup += sqrt(dpx*dpx + dpy*dpy);
    ellipse(p.x, p.y, 10, 10);
    if(green_part1 == false && rightdown > 150) green_part1 = true;
    else if(green_part1 == true && green_rightup > 150) green_ok = true;
  }
  if(dpx > 100 && dpy < 40) stroke(255, 0, 0);
  else if(dpx < 40 && dpy > 100) stroke(0, 0, 255);
  else if(green_ok) stroke(0, 255, 0); //在上面，因為下面那個在上面的話，green_ok他也會判斷執行，所以會一直是深綠色
  else if(green_part1) stroke(0, 125, 0); //左上右下深綠色(debug用)
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
