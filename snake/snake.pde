ArrayList<PVector>pt;  //食物的點
ArrayList<PVector>body;
int snakelen = 1;

void setup()
{
  size(600,400);
  //隨機產生20個代表食物的座標
  pt=new ArrayList<PVector>();
  body=new ArrayList<PVector>();
  for(int i=0;i<20;i++)
  {
    pt.add(new PVector(random(600),random(400)));
    print(pt);
  }
  //初始蛇
}

float x=300,y=200,dir=0;  //dir角度

void draw()
{
  background(0);
  
  //畫食物
  for (PVector p:pt)
  {
    fill(255,255,0);
    ellipse(p.x,p.y,10,10);
  }
  body.add(new PVector(x, y, dir));
  //畫蛇
  drawhead(x, y, dir);
  drawbody();
  
  //蛇移動
  move();
   
}

void drawhead(float x, float y, float dir) {
  ellipse(x, y, 30, 30);
  line(x, y, x+15*cos(dir), y+15*sin(dir));
}

void drawbody() {
  for(int i=0; i<body.size(); i+=10) {
    PVector b = body.get(i);
    ellipse(b.x, b.y, 30, 30);
    line(b.x, b.y, b.x+15*cos(b.z), b.y+15*sin(b.z));
  }
}

void move() {
  if(body.size()<snakelen*10) {
    body.add(new PVector(x, y, dir));
  }else {
    for(int i=body.size()-1; i>0; i--) {
      body.get(i).x = body.get(i-1).x;
      body.get(i).y = body.get(i-1).y;
      body.get(i).z = body.get(i-1).z;
    }
  }
  PVector b = body.get(0);
  x+=cos(dir);
  y+=sin(dir);
  b.x = x;
  b.y = y;
  b.z = dir;
}

void keyPressed()
{
  //鍵盤控制左右移動
  if (keyCode==RIGHT)
  {
    dir+=0.1;
  }
  if (keyCode==LEFT)
  {
    dir-=0.1;
  }
  if(keyCode == UP) {
    body.add(new PVector(x, y, dir));
    snakelen++;
  }
}
