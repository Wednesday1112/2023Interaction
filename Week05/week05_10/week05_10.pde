ArrayList<PVector> pt;

PVector ans = null;

void setup() {
  size(400, 400, P3D);
  pt = new ArrayList<PVector>();
  for(int i=0; i<20; i++) { //增加20個PVector元件(座標0~400隨機)在pt
    pt.add(new PVector( random(400), random(400) ));
  }
}

void draw() {
  background(255);
  for(PVector p : pt) { //為pt那20個PVector畫小圓
    ellipse(p.x, p.y, 10, 10);
  }
  if(ans != null) ellipse(ans.x, ans.y, 15, 15); //若滑鼠點到小圓
}                                                //把那個小圓標出來

void mouseDragged() { //滑鼠拖曳
  if(mouseButton == CENTER && ans != null) {
    ans.x = mouseX;
    ans.y = mouseY;
  }
}

void mousePressed() {
  if(mouseButton == LEFT) pt.add(new PVector(mouseX, mouseY));
  else if(mouseButton == CENTER) {
    for(PVector p : pt) { //偵測滑鼠是不是點在小圓上(每個小圓都檢查)
      if(dist(p.x, p.y, mouseX, mouseY) < 5) {
        ans = p;
      }
    }
  }
}
