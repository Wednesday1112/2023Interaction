void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(#FFF2F7);
  pushMatrix();
    translate(mouseX, mouseY); //跟著滑鼠移動
    rotateY(radians(mouseX)); //Y軸跟著滑鼠的X座標轉動
    fill(0, 255, 0); //填充綠色
    box(100);
    
    noFill(); //不填充
    scale(2); //放大2倍
    box(100);
  popMatrix();
}
