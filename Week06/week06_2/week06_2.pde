String line = "Input: ";

void setup() {
  size(500, 500);
  textSize(64);
}

void draw() {
  text(line, 100, 100);
}

void keyPressed() {
  line += key;
}
