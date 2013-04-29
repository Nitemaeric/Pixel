class gridBox {
  float x, y; // <<< midPoint
  float w, h; // <<< width & height
  float r, g, b, alpha; // <<< colour
  float prevColour;
  float colour;
  boolean filled;

  gridBox(float left, float top, float w, float h) {
    x = left + w/2;
    y = top + h/2;
    this.w = w;
    this.h = h;
    r = 255;
    g = 255;
    b = 255;
    alpha = 255;
    colour = color(r, g, b);
    filled = false;
  }

  void onDraw() {
    if (gridOn) {
      stroke(230);
    }
    else {
      stroke(r, g, b, alpha);
    }
    fill(r, g, b, alpha);
    rect(x - w/2, y - h/2, w, h);
  }

  void changeColor(ColorSelector c, int no) {
    if (no == 1) {
      r = c.r1;
      g = c.g1;
      b = c.b1;
    }
    else {
      r = c.r2;
      g = c.g2;
      b = c.b2;
    }
    prevColour = colour;
    colour = color(r, g, b);
  }
  
  void revertColor(){
    colour = prevColour;
    r = red(int(prevColour));
    g = green(int(prevColour));
    b = blue(int(prevColour));
  }
}
