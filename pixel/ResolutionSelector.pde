class ResolutionSelector {
  float x, y, w, h;

  ResolutionSelector() {
    x = 420;
    y = 95;
    w = 80;
    h = 20;
  }

  void onDraw() {
    textSize(11);
    textAlign(CENTER, CENTER);
    fill(255);
    rect(x, y, w, h);
    if (resolution == 8) {
      fill(200);
    }
    else {
      fill(255);
    }
    rect(x, y, w/4, h);
    fill(0);
    text("8", x + w/8, y + h/2);
    if (resolution == 16) {
      fill(200);
    }
    else {
      fill(255);
    }
    rect(x + w/4, y, w/4, h);
    fill(0);
    text("16", x + w/4 + w/8, y + h/2);
    if (resolution == 32) {
      fill(200);
    }
    else {
      fill(255);
    }
    rect(x + w/2, y, w/4, h);
    fill(0);
    text("32", x + w/2 + w/8, y + h/2);
    if (resolution == 64) {
      fill(200);
    }
    else {
      fill(255);
    }
    rect(x + w*3/4, y, w/4, h);
    fill(0);
    text("64", x + w*3/4 + w/8, y + h/2);
  }

  void onClick() {
    int caseNo = -1;
    if (isWithin(8) && resolution != 8) {
      resolution = 8;
      caseNo = 0;
    }
    else if (isWithin(16) && resolution != 16) {
      resolution = 16;
      caseNo = 1;
    }
    else if (isWithin(32) && resolution != 32) {
      resolution = 32;
      caseNo = 2;
    }
    else if (isWithin(64) && resolution != 64) {
      resolution = 64;
      caseNo = 3;
    }

    if (caseNo != -1) {
      grid.clear();
      for (float i = 0; i < 400; i+=400/resolution) {
        for (float j = 0; j < 400; j+=400/resolution) {
          grid.add(new gridBox(j, i, 400/resolution, 400/resolution));
        }
      }
      preview.img = createImage(int(resolution), int(resolution), RGB);
    }
  }

  boolean isWithin(int res) {
    if (res == 8) {
      if (mouseX > x && mouseX < x + w/4 && mouseY > y && mouseY < y + h) {
        return true;
      }
    }
    else if (res == 16) {
      if (mouseX > x + w/4 && mouseX < x + w/4 + w/4 && mouseY > y && mouseY < y + h) {
        return true;
      }
    }
    else if (res == 32) {
      if (mouseX > x + w/2 && mouseX < x + w/2 + w/4 && mouseY > y && mouseY < y + h) {
        return true;
      }
    }
    else if (res == 64) {
      if (mouseX > x + w*3/4 && mouseX < x + w*3/4 + w/4 && mouseY > y && mouseY < y + h) {
        return true;
      }
    }
    return false;
  }
}
