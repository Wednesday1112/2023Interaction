void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(#FFF2F7);
  pushMatrix();
    translate(mouseX, mouseY);
    rotateY(radians(mouseX));
    box(100);
  popMatrix();
}
