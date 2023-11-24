ArrayList<PVector>pt;  //食物的點
ArrayList<PVector>dot;

int n=1;

void setup()
{
  size(600,400);
  //隨機產生20個代表食物的座標
  pt=new ArrayList<PVector>();
  dot=new ArrayList<PVector>();
  for(int i=0;i<20;i++)
  {
    pt.add(new PVector(random(600),random(400)));
    print(pt);
  }
  //畫蛇頭
  dot.add(new PVector(x, y, dir));
  dot.add(new PVector(x+50, y, dir));
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
  
  
  for(PVector body:dot) {
    fill(255);
    ellipse(body.x, body.y, 30, 30);
  }
  
  //蛇移動
  move();
   
}

//void head(float x,float y,float dir)
//{
//  fill(255);
//  ellipse(x,y,30,30);
//  line(x,y,x+25*cos(dir),y+25*sin(dir));  //25是原半徑 因為線從圓心出發
//}

void move() {
  for(int i=n; i>0; i--) {
    PVector body1 = dot.get(i);
    PVector body2 = dot.get(i-1);
    body1.x = body2.x;
    body1.y = body2.y;
    body1.z = body2.z;
  }
  PVector body = dot.get(0);
  x+=cos(dir);
  y+=sin(dir);
  body.x = x;
  body.y = y;
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
    dot.add(new PVector(x, y, dir));
    n++;
  }
}
