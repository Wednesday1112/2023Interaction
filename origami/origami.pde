import processing.opengl.*;

void setup() {
  size(700, 700, OPENGL);
  noStroke();
  ellipseMode(RADIUS);
}

float x = 100, y = 100, z = -350;
float radius = 25;
void draw() {
  background(0);
  translate(width/2, height/2, z);
  rotateX(mouseX/200);
  rotateY(mouseY/200);
  fill(255);
  beginShape();
  vertex(x, y, z);
  vertex(350, 100, z);
  vertex(600, 100, z);
  vertex(600, 600, z);
  vertex(100, 600, z);
  vertex(100, 350, z);
  endShape();
  if(x == 100) {
    fill(255, 255, 0);
    ellipse(250, 250, radius, radius);
    float d = dist(mouseX, mouseY, 250, 250);
    if(mousePressed && d<radius) {
      x = 350;
      y = 350;
    }
  }
  if(x == 350) {
    fill(255, 0, 0);
    beginShape();
    vertex(350, 100, z);
    vertex(x ,y, z);
    vertex(100, 350, z);
    endShape();
  }
}
