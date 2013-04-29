class Tools {
  float x, y, w, h;
  float originX, originY;
  boolean originSet;
  boolean shiftHeld;

  Tools() {
    x = 420;
    y = 135;
    w = 80;
    h = 60;
    originSet = false;
    shiftHeld = false;
  }

  void fillTool(gridBox g) {
    g.filled = true;
    for (gridBox b : grid) {
      if (!b.filled) {
        if (within(g.x - g.w, g.y, b) && g.colour == b.colour) {
          fillTool(b);
        }
        else if (within(g.x, g.y - g.h, b) && g.colour == b.colour) {
          fillTool(b);
        }
        else if (within(g.x + g.w, g.y, b) && g.colour == b.colour) {
          fillTool(b);
        }
        else if (within(g.x, g.y + g.h, b) && g.colour == b.colour) {
          fillTool(b);
        }
      }
    }
    g.changeColor(cSelect, 1);
  }

  void drawTool(gridBox g) {
    if (mouseButton == LEFT) {
      g.changeColor(cSelect, 1);
    }
    else if (mouseButton == RIGHT) {
      g.changeColor(cSelect, 2);
    }
  }

  void resetFilled() {
    for (gridBox g : grid) {
      g.filled = false;
    }
  }

  void setOrigin(gridBox g) {
    originX = g.x;
    originY = g.y;
    originSet = true;
  }

  void rectTool(gridBox g) {
    if (originSet) {
      for (gridBox b : grid) {
        if ((b.y == originY || b.y == g.y) && ((b.x >= originX && b.x <= g.x) || (b.x >= g.x && b.x <= originX))) {
          b.changeColor(cSelect, 1);
        }
        else if((b.x == originX || b.x == g.x) && ((b.y >= originY && b.y <= g.y) || (b.y >= g.y && b.y <= originY))){
          b.changeColor(cSelect, 1);
        }
      }
    }
    originSet = false;
  }

  void onDraw() {
    for (int i = 0; i < 12; i++) {
      fill(255);
      rect(x + (20*(i%4)), y + (i/4*20), 20, 20);
    }
    textAlign(CENTER, CENTER);
    fill(0);
    //text("D", x, y, 20, 20);
    text("F", x + 20, y, 20, 20);
    text("R", x + 40, y, 20, 20);
    text("G", x, y + 20, 20, 20);
    text("C", x + 20, y + 20, 20, 20);
    text("S", x + 40, y + 20, 20, 20);
    text("O", x + 60, y + 20, 20, 20);
  }
}
