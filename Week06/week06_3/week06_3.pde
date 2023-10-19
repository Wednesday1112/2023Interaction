String line = "Input: ";

void setup() {
  size(800, 400);
  textSize(64);
}

void draw() {
  text(line, 50, 100);
}

void keyPressed() {
  if(key >= 'A' && key <= 'Z') line += key;
  if(key >= 'a' && key <= 'z') line += key;
}
