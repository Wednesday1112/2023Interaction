String Q = "hello",A = "";
float x = 100, y = 100;

void setup() {
  size(400, 600);
  textSize(20);
}

void draw() {
  background(0);
  fill(#FFFFFF); //白
  text(Q, x, y);
  fill(#FF0000); //紅
  text(A, x, y); //會蓋掉Q
  ellipse(200, 550, 20, 20);
  float dx = 200-x, dy = 550-y, d = sqrt(dx * dx + dy * dy)*3;
  x += dx / d;
  y += dy / d;
  if(keyPressed) {
    stroke(255, 0, 0);
    line(200, 550, x, y);
  }
}

void keyPressed() {
  int i = A.length();
  if(key == Q.charAt(i)) {
    A += key; //打正確了再存
  }
}
