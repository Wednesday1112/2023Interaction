//rgb問題，陣列爆掉
int sizex=1000, sizey=800;
float sizeFood=20, sizeSnake=30;
int speed=5;
float x=250, y=250, dir=0, s=1;
int snakeLen = 1;
float[] rgbr=new float[snakeLen];
float[] rgbg=new float[snakeLen];
float[] rgbb=new float[snakeLen];
ArrayList<PVector>pt = new ArrayList<PVector>();
ArrayList<PVector> body = new ArrayList<PVector>();
float dx, dy, d;
boolean mMovex = false, mMovey = false;
void setup(){
  size(1000, 800);
  for(int i=0;i<1000;i++) pt.add(new PVector(random(-sizex, 2*sizex),random(-sizey, 2*sizey)));
  rgbr[0]=random(255);
  rgbg[0]=random(255);
  rgbb[0]=random(255);
}
void draw(){
  background(#FFFFF2);
  drawmap();
  fill(255);
  dx = mouseX-x;
  dy = mouseY-y;
  d = sqrt(dx * dx + dy * dy)*3;
  stroke(0);
  drawBody();
  drawHead(x, y, dir);
  move();
  eat();
  mapMove();
}
void drawmap() {
  fill(#FFFFF2);
  stroke(255, 0, 0);
  rect(-1000, -800, 3000, 2400);
  for (PVector p:pt) {
    noStroke();
    fill(255,255,0);
    ellipse(p.x,p.y, sizeFood, sizeFood);
  }
}
void drawHead(float x, float y, float dir){
  ellipse(x, y, sizeSnake, sizeSnake);
  line(x, y, x+15*cos(dir), y+15*sin(dir) );
}
void drawBody(){
  int j=0;
  for(int i=0; i<body.size(); i+=8){
    PVector b = body.get(i);
    fill(rgbr[j], rgbg[j], rgbb[j]);
    ellipse(b.x, b.y, sizeSnake, sizeSnake);
    line(b.x, b.y, b.x-15*cos(b.z), b.y-15*sin(b.z) );
    if(j<snakeLen) j+=1;
  }
}
void move() {
  if(dist(mouseX, mouseY, x, y)>20) {
    x += dx / d*speed;
    y += dy / d*speed;
  }else {
    x+=1*cos(dir);
    y+=1*sin(dir);
    dir+=0.1;
  }
  if(body.size()<snakeLen*8){ //只發生在一開始(snakelen=1)跟按UP時(snalelen++)
    body.add( new PVector(x, y, dir) );
    if(sizeFood>5) sizeFood-=0.01;
    sizeSnake+=0.1;
  }else{
    for(int i=0; i<body.size()-1; i++){
      if(!mMovex) body.get(i).x = body.get(i+1).x;
      if(!mMovey) body.get(i).y = body.get(i+1).y;
      body.get(i).z = body.get(i+1).z;
    }
    body.get(body.size()-1).x = x;
    body.get(body.size()-1).y = y;
    body.get(body.size()-1).z = dir;
  }
}
void eat() {
  for(PVector p:pt) {
    if(p.x<=x+15 && p.x>=x-15 && p.y<=y+15 && p.y>=y-15) {
      snakeLen++;
      p.x = random(sizex);
      p.y = random(sizey);
      rgbr[snakeLen]=random(255);
      rgbg[snakeLen]=random(255);
      rgbb[snakeLen]=random(255);
    }
  }
}
void keyPressed(){
  if(keyCode==LEFT) dir -= 0.15;
  if(keyCode==RIGHT) dir += 0.15;
  if(keyCode==UP) snakeLen ++;
}
void mousePressed() {
  speed=8;
}
void mouseReleased() {
  speed=5;
}
void mapMove() {
  if(x<100) {
    mMovex = true;
    x=100;
    for(PVector p:pt) {
      p.x+=1.5;
    }
  }else if(x>sizex-100) {
    mMovex = true;
    x=sizex-100;
    for(PVector p:pt) {
      p.x-=1.5;
    }
  }else mMovex = false;
  if(y<100) {
    mMovey = true;
    y=100;
    for(PVector p:pt) {
      p.y+=1.5;
    }
  }else if(y>sizey-100) {
    mMovey = true;
    y=sizey-100;
    for(PVector p:pt) {
      p.y-=1.5;
    }
  }else mMovey = false;
}
