class PreviewPanel {
  PImage img;
  float x, y, w, h;

  PreviewPanel() {
    x = 420;
    y = 15;
    w = 80;
    h = 80;
    img = createImage(int(resolution), int(resolution), RGB);
    img.loadPixels();
    for (int i = 0; i < grid.size(); i++) {
      color c = color(grid.get(i).r, grid.get(i).g, grid.get(i).b);
      img.pixels[i] = c;
    }
    img.updatePixels();
  }

  void updateImage() {
    img.loadPixels();
    for (int i = 0; i < grid.size(); i++) {
      color c = color(grid.get(i).r, grid.get(i).g, grid.get(i).b);
      img.pixels[i] = c;
    }
    img.updatePixels();
  }

  void onDraw() {
    stroke(0);
    fill(200);
    rect(x, y, w, h);
    noFill();
    image(img, x + w/2 - resolution/2, y + h/2 - resolution/2, resolution, resolution);
    rect(x + w/2 - resolution/2 - 1, y + h/2 - resolution/2 - 1, resolution + 1, resolution + 1);
  }
}
