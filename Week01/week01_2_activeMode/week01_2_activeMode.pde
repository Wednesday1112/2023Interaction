//互動模式 Interactive Mode(Active Mode)
void setup() { //設定
  size(500, 500);
  background(255, 255, 0);
}

void draw() { //畫圖 每秒畫60次
  ellipse(mouseX, mouseY, 8, 8); //畫圈(x, y, 半徑, 半徑)
}
