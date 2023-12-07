//360度的貪食蛇
float x=250, y=250, dir=0, s=1;
int snakeLen = 1;
ArrayList<PVector>pt = new ArrayList<PVector>();
ArrayList<PVector> body = new ArrayList<PVector>();
float dx, dy, d;
boolean mMovex = false, mMovey = false;
void setup(){
  size(600,400);
  for(int i=0;i<20;i++) pt.add(new PVector(random(600),random(400)));
}
void draw(){
  background(#FFFFF2);
  //畫食物
  for (PVector p:pt)
  {
    fill(255,255,0);
    ellipse(p.x,p.y,10,10);
  }
  fill(255);
  dx = mouseX-x;
  dy = mouseY-y;
  d = sqrt(dx * dx + dy * dy)*3;
  drawBody();
  drawHead(x, y, dir);
  move();
  eat();
  mapMove();
}
void drawHead(float x, float y, float dir){
  ellipse(x, y, 15, 15);
  ellipse(x, y, 30, 30);
  line(x, y, x+15*cos(dir), y+15*sin(dir) );
}
void drawBody(){
  for(int i=0; i<body.size(); i+=8){
    PVector b = body.get(i);
    ellipse(b.x, b.y, 30, 30);
    line(b.x, b.y, b.x-15*cos(b.z), b.y-15*sin(b.z) );
  }
}
void move() {
  x += dx / d*5;
  y += dy / d*5;
  if(body.size()<snakeLen*8){ //只發生在一開始(snakelen=1)跟按UP時(snalelen++)
    body.add( new PVector(x, y, dir) );
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
      p.x = random(600);
      p.y = random(400);
    }
  }
}
void keyPressed(){
  if(keyCode==LEFT) dir -= 0.15;
  if(keyCode==RIGHT) dir += 0.15;
  if(keyCode==UP) snakeLen ++;
}
void mapMove() {
  if(x<100) {
    x=100;
    for(PVector p:pt) {
      p.x+=1;
      mMovex = true;
    }
  }else mMovex = false;
  if(y<100) {
    y=100;
    for(PVector p:pt) {
      p.y+=1;
      mMovey = true;
    }
  }else mMovey = false;
  if(x>500) {
    x=500;
    for(PVector p:pt) {
      p.x-=1;
      mMovex = true;
    }
  }else mMovex = false;
  if(y>300) {
    y=300;
    for(PVector p:pt) {
      p.y-=1;
      mMovey = true;
    }
  }else mMovey = false;
}
