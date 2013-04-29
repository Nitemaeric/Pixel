ArrayList<gridBox> grid;
ColorSelector cSelect;
ColorPalette cPalette;
PreviewPanel preview;
ResolutionSelector resSelect;
Tools tools;
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
  tools = new Tools();
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
        tools.drawTool(g);
        tools.setOrigin(g);
      }
    }
  }
  cPalette.onClick();
  resSelect.onClick();
}

void mouseDragged() {
  if (mouseX > 0 && mouseX < 400 && mouseX > 0 && mouseY < 400) {
    for (gridBox g : grid) {
      if(!tools.shiftHeld){
        if (within(mouseX, mouseY, g)) {
          tools.drawTool(g);
        }
      }
      else{
        if(tools.originSet){
          if(abs(pmouseX - mouseX) > abs(pmouseY - mouseY)){
            if(inLineX(mouseX, g)){
              tools.drawTool(g);
            }
          }
          else{
            if(inLineY(mouseY, g)){
              tools.drawTool(g);
            }
          }
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
    while (f.exists ()) {
      filename = "image"+count+".png";
      f = new File(dataPath(filename));
      count++;
    }
    preview.img.save(dataPath(filename));
    println("Saved as: "+filename);
  }
  else if (key == 'f' || key == 'F') {
    for (gridBox g : grid){
      if(within(mouseX, mouseY, g)){
        tools.fillTool(g);
        tools.resetFilled();
      }
    }
  }
  else if (key == 'r' || key == 'R') {
    if(!tools.originSet){
      for (gridBox g : grid){
        if(within(mouseX, mouseY, g)){
          tools.setOrigin(g);
        }
      }
    }
  }
  else if (key == ' '){
    color n1 = cSelect.c1, n2 = cSelect.c2;
    cSelect.setColor(n1, 2);
    cSelect.setColor(n2, 1);
  }
  else if(keyCode == SHIFT){
    tools.shiftHeld = true;
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

void keyReleased(){
  if (key == 'r' || key == 'R') {
    for (gridBox g : grid) {
      if(within(mouseX, mouseY, g)){
        tools.rectTool(g);
      }
    }
  }
  else if(keyCode == SHIFT){
    tools.shiftHeld = false;
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

boolean inLineX(float x, gridBox g){
  if (g.y == tools.originY && x > g.x - g.w/2 && x < g.x + g.w/2) {
    return true;
  }
  else{
    return false;
  }
}

boolean inLineY(float y, gridBox g){
  if (g.x == tools.originX && y > g.y - g.h/2 && y < g.y + g.h/2) {
    return true;
  }
  else{
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
  tools.onDraw();
}

