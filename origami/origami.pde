import processing.opengl.*;

void setup() {
  size(700, 700, OPENGL);
  noStroke();
  ellipseMode(RADIUS);
}

float x = 250, y = 250, z = 0;
float radius = 25;
void draw() {
  background(0);
  translate(width/2, height/2, z);
  rotate(0);
  if(mouseButton == RIGHT) {
    rotateX(mouseX/100);
    rotateY(mouseY/100);
  }
  fill(255);
  beginShape();
  vertex(-x, -y, z);
  vertex(0, -250, z);
  vertex(250, -250, z);
  vertex(250, 250, z);
  vertex(-250, 250, z);
  vertex(-250, 0, z);
  endShape();
  if(x == 250) {
    fill(255, 255, 0);
    ellipse(-x/2, -y/2, radius, radius);
    float d = dist(mouseX, mouseY, -x/2, -y/2);
    if(mousePressed && d<radius) {
      x = 0;
      y = 0;
    }
  }
  if(x == 0) {
    fill(255, 0, 0);
    beginShape();
    vertex(0, 250, z);
    vertex(x ,y, z);
    vertex(-250, 0, z);
    endShape();
  }
}
