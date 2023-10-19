String line = "";

void setup() {
  size(800, 400);
  textSize(64);
}

void draw() {
  background(0);
  text("Input: " + line, 50, 100);
}

void keyPressed() {
  if(key >= 'A' && key <= 'Z') line += key;
  if(key >= 'a' && key <= 'z') line += key;
  if(key == BACKSPACE && line.length() > 0) { //保護line長度不變負
    line = line.substring(0, line.length()-1);        //變負會當機
  }
}
