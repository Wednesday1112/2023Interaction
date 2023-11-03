int n = 25, m = 25; //地圖橫格數, 地圖直格數
int cw, ch; //格子寬度, 格子高度
int[] map; //食物位置
int[] snakex = new int[100]; //蛇x位置
int[] snakey = new int[100]; //蛇y位置
int snakesize = 1; //蛇大小
int timer = 0; //用來判斷蛇要移動了嗎
int t = 30; //速度
int direction = 0; //蛇移動方向
int foods = 0;
int timer_c = 30;
int count;

void setup()
{
  size(500, 560);
  cw= width/n;
  ch=(height-60)/m;
  map = new int[n*m];
  for (int i=0; i < n*m; i++)
  {
    map[i]= 0;
  }
  int food = (int)random(n*m);
  map[food]=1;
  snakex[0]= (int)random(n);
  snakey[0]= (int)random(3, m+3);
}

void draw()
{
  background(199);
  if (foods == 5) win();
  else if (count>0 && snakex[0] >= 0 && snakey[0] >= 3 && snakex[0] != n && snakey[0] != m+3) {
    drawmap();
    drawsnake();
    timer++;
    if (( timer % t)==0) {
      move();
      check();

      timer =0;
    }
  } else gameover();
  count=timer_c-millis()/1000;
  fill(0, 0, 255);
  textSize(30);
  if (count>=0)  text("Time: "+count, 20, 25);
}

void check() //檢查食物是否被吃，並生成新的
{
  int newpsnakex = snakex[0];
  int newpsnakey = snakey[0];
  if (snakey[0] >= 3 && snakey[0] <= m+2) {

    if (map[(newpsnakey-3)*n+ newpsnakex] ==1)
    {
      foods++;
      println("吃了 "+foods+" 個");

      int lsnakex = snakex[snakesize-1];
      int lsnakey = snakey[snakesize-1];

      map[(newpsnakey-3)*n+ newpsnakex]=0;
      int food = (int)random(n*m);
      map[food]=1;
      snakesize++;

      snakex[snakesize-1] = lsnakex;
      snakey[snakesize-1] = lsnakey;
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
      rect( j*cw, (i+3)*ch, cw, ch); //j在前，從左到右，i在前，從上到下
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

void gameover() {
  fill(0, 255, 0);
  rect(100, 100, 300, 300);
}

void win() {
  fill(255, 255, 0);
  rect(100, 100, 300, 300);
}
