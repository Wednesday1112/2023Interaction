PImage img;
void setup() {
  size(800, 600);
  img = loadImage("keyboard.jpg");
}

void draw() {
  image(img, 0, 600-266);
}
