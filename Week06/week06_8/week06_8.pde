String [] QQ = {"void", "setup", "string", "background", "fill"}; //單字庫
String Q = "",A = "";
float x = 100, y = 100;

void setup() {
  size(400, 600);
  textSize(20);
  randomQ();
}

void randomQ() {
  int i = int(random(QQ.length)); //隨機單字
  Q = QQ[i];
  x = random(0, 300); //隨機位置
  y = random(0, 100); //隨機位置
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
    if(Q.equals(A)) {
      randomQ(); //重新生成單字
      A = ""; //攻擊重設
    }
  }
}
