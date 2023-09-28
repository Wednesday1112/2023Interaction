size(400, 400);
background(255);
colorMode(HSB, 400); //colorMode(HSB, 400, 400, 400);

for(int i=0; i<400; i++) {
  for(int j=0; j<400; j++) {
    stroke(i, j, 400);
    point(i, j);
  }
}
