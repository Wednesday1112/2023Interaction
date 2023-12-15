//眼睛dir
int sizex=1000, sizey=800;
float sizeFood=20, sizeSnake=30;
int speed=5;
float x=250, y=250, dir=0, s=1;
float eyex_r=230, eyey_r=230, eyex_l=230, eyey_l=270;
int snakeLen = 1;
ArrayList<PVector>rgb = new ArrayList<PVector>();
ArrayList<PVector>pt = new ArrayList<PVector>();
ArrayList<PVector> body = new ArrayList<PVector>();
float dx, dy, d;
float deyex_r, deyey_r, eyed_r, deyex_l, deyey_l, eyed_l;
boolean mMovex = false, mMovey = false;
void setup(){
  size(1000, 800);
  for(int i=0;i<1000;i++) pt.add(new PVector(random(-sizex, 2*sizex),random(-sizey, 2*sizey)));
  rgb.add(new PVector(random(255), random(255), random(255)));
}
void draw(){
  background(#FFFFF2);
  drawmap();
  fill(255);
  dx = mouseX-x;
  dy = mouseY-y;
  d = sqrt(dx * dx + dy * dy)*3;
  deyex_r = mouseX-eyex_r;
  deyey_r = mouseY-eyey_r;
  eyed_r = sqrt(deyex_r * deyex_r + deyey_r * deyey_r)*3;
  deyex_l = mouseX-eyex_l;
  deyey_l = mouseY-eyey_l;
  eyed_l = sqrt(deyex_l * deyex_l + deyey_l * deyey_l)*3;
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
  fill(255);
  ellipse(eyex_r+15*cos(dir), eyey_r+15*sin(dir), sizeSnake/2.5, sizeSnake/2.5);
  ellipse(eyex_l+15*cos(dir), eyey_l+15*sin(dir), sizeSnake/2.5, sizeSnake/2.5);
}
void drawBody(){
  int j=0;
  for(int i=0; i<body.size(); i+=8){
    PVector b = body.get(i);
    fill(rgb.get(j).x, rgb.get(j).y, rgb.get(j).z);
    ellipse(b.x, b.y, sizeSnake, sizeSnake);
    line(b.x, b.y, b.x-15*cos(b.z), b.y-15*sin(b.z) );
    j+=1;
  }
}
void move() {
  if(dist(mouseX, mouseY, x, y)>20) {
    x += dx / d*speed;
    y += dy / d*speed;
    eyex_r += deyex_r / eyed_r*speed;
    eyey_r += deyey_r / eyed_r*speed;
    eyex_l += deyex_l / eyed_l*speed;
    eyey_l += deyey_l / eyed_l*speed;
  }else {
    x+=1*cos(dir);
    y+=1*sin(dir);
    eyex_r+=1*cos(dir);
    eyey_r+=1*sin(dir);
    eyex_l+=1*cos(dir);
    eyey_l+=1*sin(dir);
    dir+=0.05;
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
    if(p.x<=x+sizeSnake/2 && p.x>=x-sizeSnake/2 && p.y<=y+sizeSnake/2 && p.y>=y-sizeSnake/2) {
      snakeLen++;
      p.x = random(sizex);
      p.y = random(sizey);
      rgb.add(new PVector(random(255), random(255), random(255)));
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
