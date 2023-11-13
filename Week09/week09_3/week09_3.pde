PImage img;
int [][] pos = {{93,491},{246,525},{177,523},{159,489},{152,455},{196,489},{231,489},{261,490},{321,456},{298,492},{331,491},{366,491},{313,525},{277,523},{353,456},{389,456},{83,456},{186,457},{127,491},{218,456},{289,456},{217,524},{120,455},{143,524},{255,456},{106,523}};
void setup() {
  size(800, 600);
  img = loadImage("keyboard.jpg");
  rectMode(CENTER);
}

void draw() {
  background(#FFFFF2);
  image(img, 0, 600-266);
  fill(255, 0, 0, 128);
  rect(mouseX, mouseY, 28, 30, 5); //半透紅
  fill(0, 255, 0, 128); //半透綠
  for(int i = 0; i < 26; i++) {
    rect(pos[i][0], pos[i][1], 28, 30, 5);
  }
}

void mousePressed() {
  println(mouseX, mouseY);
}
