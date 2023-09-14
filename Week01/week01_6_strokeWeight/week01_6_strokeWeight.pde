void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

int w=1;
void keyPressed() {
  if(key == '1') stroke(255, 0, 0);
  if(key == '2') stroke(0, 255, 0);
  if(key == '3') stroke(0, 0, 255);
  if(key == 's' || key == 'S') save("draw.png");
  if(key == '+') strokeWeight(++w); //筆寬+1
  if(key == '-') strokeWeight(--w);  //筆寬-1
  println("現在筆寬: "+w);
}
