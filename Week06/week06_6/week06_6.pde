import processing.sound.*;

String line = "";
SoundFile dada, good, bad;

void setup() {
  size(800, 400);
  textSize(64);
  dada = new SoundFile(this, "dada.mp3");
  good = new SoundFile(this, "good.mp3");
  bad = new SoundFile(this, "bad.mp3");
}

void draw() {
  background(0);
  text("Inoput: " + line, 50, 100);
}

void keyPressed() {
  if(key >= 'A' && key <= 'Z') {
    line += key;
    dada.play();
  }
  if(key >= 'a' && key <= 'z') {
    line += key;
    dada.play();
  }
  if(key == BACKSPACE && line.length() > 0) {
    line = line.substring(0, line.length()-1);
    bad.play();
  }
  if(key == ENTER) {
    good.play();
  }
}
