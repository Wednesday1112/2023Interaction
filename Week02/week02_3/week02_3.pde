PImage img, imgbk;
void setup() {
  size(600, 600);
  img = loadImage("san.png");
  imgbk = loadImage("back.png");
}
void draw() {
  imageMode(CENTER);
  if(mousePressed) {
    image(imgbk, mouseX, mouseY);
  }else{
    image(img, 300, 300, 220, 300);
  }
}
