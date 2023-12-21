ArrayList<PVector>pt=new ArrayList<PVector>();  //食物的點
ArrayList<PVector>body=new ArrayList<PVector>();  //蛇身
ArrayList<PVector>body2=new ArrayList<PVector>();  //蛇2
ArrayList<PVector>rgb = new ArrayList<PVector>();  //改變身體顏色
int snakelen = 1,snakelen2=1;
int s=1;
int snake=0;
int sizeX=1000,sizeY=800;
int speed=5;
float sizeFood=20,sizeSnake=30;
float x=250, y=250, dir=0;  //dir角度
float x2=random(-600,600),y2=random(-400,400),dir2=0;
float dx, dy, d;
boolean speedup=false;
float mapSpeed=1.5;

void setup()
{
  size(1000, 800);
  for(int i=0;i<1000;i++) 
    pt.add(new PVector(random(-sizeX, 2*sizeX),random(-sizeY, 2*sizeY)));
    rgb.add(new PVector(random(255), random(255), random(255)));
}

void draw()
{
  background(0);
  drawmap();
  fill(255);
  dx = mouseX-x;
  dy = mouseY-y;
  d = sqrt(dx * dx + dy * dy)*3;
  stroke(0);
  drawsnake2();
  drawbody();
  drawhead(x, y, dir);
  move();
  eat(x,y,0);
  mapMove();
  hit();
}

//限制畫布範圍
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

//畫布移動
void mapMove() {
  if(x<100) {
    x=100;
    for(PVector p:pt) p.x+=mapSpeed;
    for(PVector b:body) b.x+=mapSpeed;
    for(PVector b2:body2) b2.x+=mapSpeed;
  }else if(x>sizeX-100) {
    x=sizeX-100;
    for(PVector p:pt) p.x-=mapSpeed;
    for(PVector b:body) b.x-=mapSpeed;
    for(PVector b2:body2) b2.x-=mapSpeed;
  }
  if(y<100) {
    y=100;
    for(PVector p:pt) p.y+=mapSpeed;
    for(PVector b:body) b.y+=mapSpeed;
    for(PVector b2:body2) b2.y+=mapSpeed;
  }else if(y>sizeY-100) {
    y=sizeY-100;
    for(PVector p:pt) p.y-=mapSpeed;
    for(PVector b:body) b.y-=mapSpeed;
    for(PVector b2:body2) b2.y-=mapSpeed;
  }
}

void drawbody(){
  int j=0;
  for(int i=0; i<body.size(); i+=8){
    PVector b = body.get(i);
    noStroke();
    fill(rgb.get(j).x, rgb.get(j).y, rgb.get(j).z);
    ellipse(b.x, b.y, sizeSnake, sizeSnake);
    line(b.x, b.y, b.x-15*cos(b.z), b.y-15*sin(b.z) );
    j+=1;
  }
}

void drawhead(float x, float y, float dir) {
  noStroke();
  ellipse(x, y, sizeSnake, sizeSnake);
  line(x, y, x+15*cos(dir), y+15*sin(dir));
  fill(255);
}

//移動
void move() {
  if(dist(mouseX, mouseY, x, y)<20) {
    x+=1*cos(dir);
    y+=1*sin(dir);
    dir+=0.1;
  }
  else {
    x += dx / d*speed;
    y += dy / d*speed;
  }
  if(body.size()<snakelen*8){ //只發生在一開始(snakelen=1)跟按UP時(snalelen++)
    body.add( new PVector(x, y, dir) );
    if(sizeFood>5) sizeFood-=0.01;
    sizeSnake+=0.1;
  }else{
    for(int i=0; i<body.size()-1; i++){
      body.get(i).x = body.get(i+1).x;
      body.get(i).y = body.get(i+1).y;
      body.get(i).z = body.get(i+1).z;
    }
    body.get(body.size()-1).x = x;
    body.get(body.size()-1).y = y;
    body.get(body.size()-1).z = dir;
  }
}

//遊戲中亂入的蛇（障礙）
void drawsnake2() {
  for(int i=0; i<body2.size(); i+=8){
    PVector b2 = body2.get(i);
    fill(random(150,255),random(100),random(50));
    ellipse(b2.x, b2.y, 30, 30);
    line(b2.x, b2.y, b2.x-15*cos(b2.z), b2.y-15*sin(b2.z) );
  }
  
  // 改變方向
  dir2 += random(-0.2,0.2);
  x2 += cos(dir2) * 1.5;
  y2 += sin(dir2) *1.5;

  if(body2.size()<snakelen2*8){
    body2.add(new PVector(x2, y2, dir2) ); 
  }else{
    for(int i=0; i<body2.size()-1; i++){
      body2.get(i).x = body2.get(i+1).x;
      body2.get(i).y = body2.get(i+1).y;
      body2.get(i).z = body2.get(i+1).z;
    }
    body2.get(body2.size()-1).x = x2;
    body2.get(body2.size()-1).y = y2;
    body2.get(body2.size()-1).z = dir2;
  }
  eat(x2,y2,1);
}

//吃到食物偵測
void eat(float x,float y,int snake)
{
  for(PVector p:pt) 
  {
    if(p.x<=x+sizeSnake/2 && p.x>=x-sizeSnake/2 && p.y<=y+sizeSnake/2 && p.y>=y-sizeSnake/2) {
      if (snake==0)
        snakelen++;
      else if (snake==1)
        snakelen2++;
      p.x=random(sizeX);
      p.y=random(sizeY);
      rgb.add(new PVector(random(255), random(255), random(255)));
    }
  }
}

int min;
void hit()
{
  if(body.size()>body2.size())
    min=body2.size();
  else min=body.size();
  for(int i=0; i<min-1; i++){
      if (dist(body2.get(i).x,body2.get(i).y,body.get(i).x,body.get(i).y)<80) //IndexOutOfBoundsException: Index 16 out of bounds for length 16
        {
          println("OHHHHH");
          fill(0,255,0);
        }
    }
}

void keyPressed(){
  if(keyCode==LEFT) dir -= 0.15;
  if(keyCode==RIGHT) dir += 0.15;
  if(keyCode==UP) snakelen ++;
}
void mousePressed() {
  speed=8;
  mapSpeed=2.5;
}
void mouseReleased() {
  speed=5;
  mapSpeed=1.5;
}
