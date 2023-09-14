void setup() {
  size(500, 500);
  background(255); //白色(全部255)
}

void draw() {
  if(mousePressed) { //滑鼠按下
    line(mouseX, mouseY, pmouseX, pmouseY);
    //畫線(x, y, 到x, y)
  }
}
