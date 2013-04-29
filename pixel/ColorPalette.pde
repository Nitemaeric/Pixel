class ColorPalette {
  float x, y, w, h;
  ArrayList<Integer> colorList;
  ArrayList<Integer> favourites;

  ColorPalette() {
    x = width - 180;
    y = 15;
    w = 160;
    h = 240;
    favourites = new ArrayList<Integer>();
    for (int i = 0; i < 5; i++) {
      favourites.add(color(255));
    }
    colorList = new ArrayList<Integer>();
    colorList.add(color(255, 0, 0));
    colorList.add(color(0, 255, 0));
    colorList.add(color(0, 0, 255));
    colorList.add(color(0, 255, 255));
    colorList.add(color(255, 0, 255));
    colorList.add(color(255, 255, 0));
    colorList.add(color(0, 0, 0));
    colorList.add(color(255, 255, 255));

    colorList.add(color(204, 0, 0));
    colorList.add(color(0, 204, 0));
    colorList.add(color(0, 0, 204));
    colorList.add(color(0, 204, 204));
    colorList.add(color(204, 0, 204));
    colorList.add(color(204, 204, 0));
    colorList.add(color(26, 26, 26));
    colorList.add(color(204, 204, 204));

    colorList.add(color(153, 0, 0));
    colorList.add(color(0, 153, 0));
    colorList.add(color(0, 0, 153));
    colorList.add(color(0, 153, 153));
    colorList.add(color(153, 0, 153));
    colorList.add(color(153, 153, 0));
    colorList.add(color(51, 51, 51));
    colorList.add(color(179, 179, 179));

    colorList.add(color(102, 0, 0));
    colorList.add(color(0, 102, 0));
    colorList.add(color(0, 0, 102));
    colorList.add(color(0, 102, 102));
    colorList.add(color(102, 0, 102));
    colorList.add(color(102, 102, 0));
    colorList.add(color(76, 76, 76));
    colorList.add(color(153, 153, 153));

    colorList.add(color(51, 0, 0));
    colorList.add(color(0, 51, 0));
    colorList.add(color(0, 0, 51));
    colorList.add(color(0, 51, 51));
    colorList.add(color(51, 0, 51));
    colorList.add(color(51, 51, 0));
    colorList.add(color(102, 102, 102));
    colorList.add(color(127, 127, 127));

    colorList.add(color(255, 63, 63));
    colorList.add(color(63, 255, 63));
    colorList.add(color(63, 63, 255));
    colorList.add(color(63, 255, 255));
    colorList.add(color(255, 63, 255));
    colorList.add(color(255, 255, 63));
    colorList.add(color(165, 42, 42));
    colorList.add(color(210, 105, 30));

    colorList.add(color(255, 127, 127));
    colorList.add(color(127, 255, 127));
    colorList.add(color(127, 127, 255));
    colorList.add(color(127, 255, 255));
    colorList.add(color(255, 127, 255));
    colorList.add(color(255, 255, 127));
    colorList.add(color(139, 69, 19));
    colorList.add(color(160, 82, 45));

    colorList.add(color(204, 127, 127));
    colorList.add(color(127, 204, 127));
    colorList.add(color(127, 127, 204));
    colorList.add(color(127, 204, 204));
    colorList.add(color(204, 127, 204));
    colorList.add(color(204, 204, 127));
    colorList.add(color(205, 133, 63));
    colorList.add(color(222, 184, 135));

    colorList.add(color(204, 127, 63));
    colorList.add(color(127, 204, 63));
    colorList.add(color(127, 63, 204));
    colorList.add(color(164, 54, 135));
    colorList.add(color(54, 135, 164));
    colorList.add(color(135, 164, 54));
    colorList.add(color(205, 133, 63));
    colorList.add(color(222, 184, 135));
    
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
    colorList.add(color(255, 255, 255));
  }

  void setFavourite(color c, int no) {
    favourites.set(no - 1, c);
  }

  void onClick() {
    if (mouseX > width - 180 && mouseX < width - 20 && mouseY > 15 && mouseY < 255) {
      color pixel = get(mouseX, mouseY);
      if (mouseButton == LEFT) {
        cSelect.setColor(pixel, 1);
      }
      else if (mouseButton == RIGHT) {
        cSelect.setColor(pixel, 2);
      }
    }
  }

  void onDraw() {
    // favourites
    textAlign(CENTER, CENTER);
    fill(favourites.get(0));
    rect(x + 10, 295, 20, 20);
    fill(0);
    text("1", x + 20, 305);
    fill(favourites.get(1));
    rect(x + 40, 295, 20, 20);
    fill(0);
    text("2", x + 50, 305);
    fill(favourites.get(2));
    rect(x + 70, 295, 20, 20);
    fill(0);
    text("3", x + 80, 305);
    fill(favourites.get(3));
    rect(x + 100, 295, 20, 20);
    fill(0);
    text("4", x + 110, 305);
    fill(favourites.get(4));
    rect(x + 130, 295, 20, 20);
    fill(0);
    text("5", x + 140, 305);
    // palette
    stroke(0);
    fill(255);
    rect(x, y, w, h);
    // colors
    for (int i = 0; i < colorList.size(); i++) {
      noStroke();
      fill(colorList.get(i));
      rect(x + (20*(i%8)), y + (i/8*20), 20, 20);
    }
    // palette border
    stroke(0);
    noFill();
    rect(x, y, w, h);
    // hex code
    fill(0);
    stroke(0);
    textSize(12);
    textAlign(CENTER);
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      color c = get(mouseX, mouseY);
      float red = red(c);
      float green = green(c);
      float blue = blue(c);
      fill(c);
      rect(x, 265, 160, 20);
      if (red(c) < 55 && green(c) < 55 && blue(c) < 110) {
        fill(255);
      }
      else {
        fill(0);
      }
      text("#"+hex(int(red), 2)+hex(int(green), 2)+hex(int(blue), 2), x + 160/2, 280);
      //println(red+" "+green+" "+blue);
    }
    else {
      fill(color(cSelect.r1, cSelect.g1, cSelect.b1));
      rect(x, 265, 160, 20);
      if (cSelect.r1 < 55 && cSelect.g1 < 55 && cSelect.b1 < 110) {
        fill(255);
      }
      else {
        fill(0);
      }
      text("#"+hex(int(cSelect.r1), 2)+hex(int(cSelect.g1), 2)+hex(int(cSelect.b1), 2), x + 160/2, 280);
    }
  }
}
