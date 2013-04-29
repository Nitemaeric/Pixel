class ColorSelector {
  float r1, g1, b1, r2, g2, b2;
  float x1, y1, x2, y2;
  color c1, c2;

  ColorSelector() {
    x1 = width - 160;
    y1 = height - 65;
    x2 = width - 80;
    y2 = y1;
    r2 = 255;
    g2 = 255;
    b2 = 255;
    c1 = color(r1, g1, b1);
    c2 = color(r2, g2, b2);
  }

  void setColor(color c, int no) {
    if (no == 1) {
      r1 = red(c);
      g1 = green(c);
      b1 = blue(c);
      c1 = c;
    }
    else {
      r2 = red(c);
      g2 = green(c);
      b2 = blue(c);
      c2 = c;
    }
  }

  void onDraw() {
    stroke(0);
    fill(255);
    rect(x1 - 20, y1 - 10, 160, 60);
    stroke(30);
    fill(r1, g1, b1);
    rect(x1, y1, 40, 40);
    stroke(30);
    fill(r2, g2, b2);
    rect(x2, y2, 40, 40);
  }
}
