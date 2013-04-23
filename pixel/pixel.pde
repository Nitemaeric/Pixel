ArrayList<gridBox> grid;
ColorSelector cSelect;
ColorPalette cPalette;
PreviewPanel preview;
ResolutionSelector resSelect;
boolean gridOn;
float resolution;

void setup() {
  size(700, 400);
  frame.setTitle("Pixel Helper v.1");
  textAlign(CENTER);
  grid = new ArrayList<gridBox>();
  cSelect = new ColorSelector();
  cPalette = new ColorPalette();
  resSelect = new ResolutionSelector();
  gridOn = true;
  resolution = 32;
  for (float i = 0; i < 400; i+=400/resolution) {
    for (float j = 0; j < 400; j+=400/resolution) {
      grid.add(new gridBox(j, i, 400/resolution, 400/resolution));
    }
  }
  preview = new PreviewPanel();
}

void mousePressed() {
  if (mouseX > 0 && mouseX < 400 && mouseX > 0 && mouseY < 400) {
    for (gridBox g : grid) {
      if (within(mouseX, mouseY, g)) {
        if (mouseButton == LEFT) {
          g.changeColor(cSelect, 1);
        }
        else if (mouseButton == RIGHT) {
          g.changeColor(cSelect, 2);
        }
      }
    }
  }
  if (mouseX > width - 180 && mouseX < width - 20 && mouseY > 15 && mouseY < 255) {
    color pixel = get(mouseX, mouseY);
    if (mouseButton == LEFT) {
      cSelect.setColor(pixel, 1);
    }
    else if (mouseButton == RIGHT) {
      cSelect.setColor(pixel, 2);
    }
  }
  resSelect.onClick();
}

void mouseDragged() {
  if (mouseX > 0 && mouseX < 400 && mouseX > 0 && mouseY < 400) {
    for (gridBox g : grid) {
      if (within(mouseX, mouseY, g)) {
        if (mouseButton == LEFT) {
          g.changeColor(cSelect, 1);
        }
        else if (mouseButton == RIGHT) {
          g.changeColor(cSelect, 2);
        }
      }
    }
  }
}

void keyPressed() {  
  if (key == 'c' || key == 'C') {
    for (gridBox g : grid) {
      g.changeColor(cSelect, 2);
    }
  }
  else if (key == 'g' || key == 'G') {
    if (gridOn) {
      gridOn = false;
    }
    else {
      gridOn = true;
    }
  }
  else if (key == 's' || key == 'S') {
    String filename = "image.png";
    File f = new File(dataPath(filename));
    int count = 1;
    while(f.exists()){
      filename = "image"+count+".png";
      f = new File(dataPath(filename));
      count++;
    }
    preview.img.save(dataPath(filename));
    println("Saved as: "+filename);
  }

  if (mouseX > width - 180 && mouseX < width - 20 && mouseY > 15 && mouseY < 255) {
    if (key == '1' || key == '!') {
      color pixel = get(mouseX, mouseY);
      cPalette.setFavourite(pixel, 1);
    }
    else if (key == '2' || key == '@') {
      color pixel = get(mouseX, mouseY);
      cPalette.setFavourite(pixel, 2);
    }
    else if (key == '3' || key == '#') {
      color pixel = get(mouseX, mouseY);
      cPalette.setFavourite(pixel, 3);
    }
    else if (key == '4' || key == '$') {
      color pixel = get(mouseX, mouseY);
      cPalette.setFavourite(pixel, 4);
    }
    else if (key == '5' || key == '%') {
      color pixel = get(mouseX, mouseY);
      cPalette.setFavourite(pixel, 5);
    }
  }
  else {
    if (key == '1' || key == '!') {
      cSelect.setColor(cPalette.favourites.get(0), 1);
    }
    else if (key == '2' || key == '@') {
      cSelect.setColor(cPalette.favourites.get(1), 1);
    }
    else if (key == '3' || key == '#') {
      cSelect.setColor(cPalette.favourites.get(2), 1);
    }
    else if (key == '4' || key == '$') {
      cSelect.setColor(cPalette.favourites.get(3), 1);
    }
    else if (key == '5' || key == '%') {
      cSelect.setColor(cPalette.favourites.get(4), 1);
    }
  }
}

boolean within(float x, float y, gridBox g) {
  if (x > g.x - g.w/2 && x < g.x + g.w/2 && y > g.y - g.h/2 && y < g.y + g.h/2) {
    return true;
  }
  else {
    return false;
  }
}

void draw() {
  background(127);
  for (gridBox g : grid) {
    g.onDraw();
  }
  stroke(0);
  noFill();
  rect(0, 0, width-1, height-1);
  rect(0, 0, 400, 400);
  cSelect.onDraw();
  cPalette.onDraw();
  preview.onDraw();
  preview.updateImage();
  resSelect.onDraw();
}

class gridBox {
  float x, y; // <<< midPoint
  float w, h; // <<< width & height
  float r, g, b, alpha; // <<< colour

  gridBox(float left, float top, float w, float h) {
    x = left + w/2;
    y = top + h/2;
    this.w = w;
    this.h = h;
    r = 255;
    g = 255;
    b = 255;
    alpha = 255;
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
  }
}

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
  }

  void setFavourite(color c, int no) {
    favourites.set(no - 1, c);
  }

  void onDraw() {
    // favourites
    fill(favourites.get(0));
    rect(x + 10, 295, 20, 20);
    fill(favourites.get(1));
    rect(x + 40, 295, 20, 20);
    fill(favourites.get(2));
    rect(x + 70, 295, 20, 20);
    fill(favourites.get(3));
    rect(x + 100, 295, 20, 20);
    fill(favourites.get(4));
    rect(x + 130, 295, 20, 20);
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

class ColorSelector {
  float r1, g1, b1, r2, g2, b2;
  float x1, y1, x2, y2;

  ColorSelector() {
    x1 = width - 160;
    y1 = height - 65;
    x2 = width - 80;
    y2 = y1;
    r2 = 255;
    g2 = 255;
    b2 = 255;
  }

  void setColor(color c, int no) {
    if (no == 1) {
      r1 = red(c);
      g1 = green(c);
      b1 = blue(c);
    }
    else {
      r2 = red(c);
      g2 = green(c);
      b2 = blue(c);
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

class ResolutionSelector {
  float x, y, w, h;
  
  ResolutionSelector(){
    x = 420;
    y = 95;
    w = 80;
    h = 20;
  }

  void onDraw(){
    textSize(11);
    textAlign(CENTER, CENTER);
    fill(255);
    rect(x, y, w, h);
    if(resolution == 8){
      fill(200);
    }
    else{
      fill(255);
    }
    rect(x, y, w/4, h);
    fill(0);
    text("8", x + w/8, y + h/2);
    if(resolution == 16){
      fill(200);
    }
    else{
      fill(255);
    }
    rect(x + w/4, y, w/4, h);
    fill(0);
    text("16", x + w/4 + w/8, y + h/2);
    if(resolution == 32){
      fill(200);
    }
    else{
      fill(255);
    }
    rect(x + w/2, y, w/4, h);
    fill(0);
    text("32", x + w/2 + w/8, y + h/2);
    if(resolution == 64){
      fill(200);
    }
    else{
      fill(255);
    }
    rect(x + w*3/4, y, w/4, h);
    fill(0);
    text("64", x + w*3/4 + w/8, y + h/2);
  }

  void onClick(){
    int caseNo = -1;
    if(isWithin(8) && resolution != 8){
      resolution = 8;
      caseNo = 0;
    }
    else if(isWithin(16) && resolution != 16){
      resolution = 16;
      caseNo = 1;
    }
    else if(isWithin(32) && resolution != 32){
      resolution = 32;
      caseNo = 2;
    }
    else if(isWithin(64) && resolution != 64){
      resolution = 64;
      caseNo = 3;
    }

    if(caseNo != -1){
      grid.clear();
      for (float i = 0; i < 400; i+=400/resolution) {
        for (float j = 0; j < 400; j+=400/resolution) {
          grid.add(new gridBox(j, i, 400/resolution, 400/resolution));
        }
      }
      preview.img = createImage(int(resolution), int(resolution), RGB);
    }
  }

  boolean isWithin(int res){
    if(res == 8){
      if(mouseX > x && mouseX < x + w/4 && mouseY > y && mouseY < y + h){
        return true;
      }
    }
    else if(res == 16){
      if(mouseX > x + w/4 && mouseX < x + w/4 + w/4 && mouseY > y && mouseY < y + h){
        return true;
      }
    }
    else if(res == 32){
      if(mouseX > x + w/2 && mouseX < x + w/2 + w/4 && mouseY > y && mouseY < y + h){
        return true;
      }
    }
    else if(res == 64){
      if(mouseX > x + w*3/4 && mouseX < x + w*3/4 + w/4 && mouseY > y && mouseY < y + h){
        return true;
      }
    }
    return false;
  }
}
