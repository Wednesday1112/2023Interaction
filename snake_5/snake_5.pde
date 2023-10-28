int n=25; //地圖橫格數
int m=25; //地圖直格數
int cw ; //格子寬度
int ch; //格子高度
int[] map; //食物位置
int[] snakex = new int[100]; //蛇x位置
int[] snakey= new int[100]; //蛇y位置
int snakesize=1; //蛇大小
int timer =0; //用來判斷蛇要移動了嗎
int direction=0; //蛇移動方向

void setup()
{
  size(500, 500);
  cw= width/n;
  ch=height/m;
  map = new int[n*m];
  for (int i=0; i < n*m; i++)
  {
    map[i]= 0;
  }
  int food = (int)random(n*m);
  map[food]=1;
  snakex[0]= (int)random(n);
  snakey[0]= (int)random(m);
}

void draw()
{
  drawmap();
  drawsnake();
  timer++;
  if (( timer %30)==0)
  {
    move();
    check();

    timer =0;
  }
}

void check() //檢查食物是否被吃，並生成新的
{
  int newpsnakex = snakex[0];
  int newpsnakey = snakey[0];

  if (map[newpsnakey*n+ newpsnakex] ==1)
  {
    map[newpsnakey*n+ newpsnakex]=0;
    int food = (int)random(n*m);
    map[food]=1;
    snakesize++;
    for (int i = snakesize-1; i>0; i--)
    {
      snakex[i ]=snakex[i-1 ];
      snakey[i ]=snakey[i-1 ];
    }
  }
}

void keyPressed()
{
  char c=key;
  switch(c)
  {
  case 'a':
    direction =0;
    break;
  case 'd':
    direction =3;
    break;
  case 'w':
    direction =1;
    break;
  case 's':
    direction =2;
    break;
  }
}

void move()
{
  for (int i = snakesize-1; i>0; i--)
  {
    snakex[i ]=snakex[i-1 ]; //snakex[0]是頭，所以把snakex[0]清出來放新頭
    snakey[i ]=snakey[i-1 ];
  }
  int newpsnakex = snakex[0]; //蛇新位置
  int newpsnakey = snakey[0];
  switch(direction)
  {
  case 0: //往左
    newpsnakex--;
    break;
  case 1: //往上
    newpsnakey--;
    break;
  case 2: //往下
    newpsnakey++;
    break;
  case 3: //往右
    newpsnakex++;
    break;
  }
  snakex[0]=newpsnakex; //套用
  snakey[0]=newpsnakey;
}

void drawmap() {
  int count =0;
  for ( int i=0; i < m; i++)
  {
    for ( int j = 0; j < n; j ++)
    {
      if ( map[count]==1)
      {
        fill(255, 0, 0); //食物
      } else
        fill(255);
      rect( j*cw, i*ch, cw, ch); //j在前，從左到右，i在前，從上到下
      count++;
    }
  }
}

void drawsnake() {
  fill(0, 0, 255);
  for ( int i = 0; i < snakesize; i++)
  {
    int psnakex = snakex[i]; //蛇現在的x
    int psnakey = snakey[i]; //蛇現在的y
    rect(psnakex*cw, psnakey*ch, cw, ch);
  }
}
