ArrayList<PVector> pt; //一種資料結構，取名pt
void setup() {
  size(400, 400, P3D);
  pt = new ArrayList<PVector>(); //初始化
}

void draw() {
  background(#FFF2F7);
  pushMatrix();
    if(mousePressed && mouseButton == RIGHT) {
      translate(200, 200);
      rotateY(radians(frameCount));
      translate(-200, -200);
    }
    for(PVector p : pt) { //把pt裡的物件一個一個拿出來，放進p
      ellipse(p.x, p.y, 10, 10);
    }
    beginShape();
      for(PVector p : pt) { //把pt裡的物件一個一個拿出來，放進p
        vertex(p.x, p.y);
      }
    endShape();
  popMatrix();
}
void mousePressed() {
  if(mouseButton == LEFT) {
    pt.add(new PVector(mouseX, mouseY)); //在pt裡加入PVector物件
  }
}
