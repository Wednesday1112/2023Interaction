void setup() {
  size(400, 400);
}

int [][] card = new int[8][11];
color [] C = {#FF5555, #FFAA00, #55AA55, #5555FF};
void draw() {
  background(255);
  for(int i=0; i<8; i++) {
    for(int j=0; j<11; j++) {
      drawCard(j*32, i*50, C[i%4], j);
    }
  }
}
void drawCard(int x, int y, color c, int n) {
  stroke(128); //灰線
  fill(255); //白色
  rect(x, y, 32, 50, 7);
  noStroke();
  fill(c);
  rect(x+3, y+3, 32-5, 50-5, 4);
  
  pushMatrix();
  fill(255);
  translate(x+16, y+25); //把中心點移到(每張)卡的中央
  rotate(radians(45)); //45度
  ellipse(0, 0, 20, 30);
  popMatrix();
  
  textSize(9);
  textAlign(CENTER, CENTER);
  text(""+n, x+7, y+6);
  
  textSize(20);
  fill(c);
  text(""+n, x+16, y+22);
}
