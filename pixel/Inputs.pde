class Button {
  float x, y, w, h;
  String text;
  color textColour, bgColour;
  
  Button(String t, float x, float y, float w, float h, color tc, color bc){
    text = t;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    textColour = tc;
    bgColour = bc;
  }
  
  void onClick(){
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
      //DO SOMETHING
    }
  }
  
  void onDraw(){
    fill(bgColour);
    rect(x, y, w, h);
    fill(textColour);
    text(text, x, y, w, h);
  }
}

class InputBox {
  float x, y, w, h;
  String text;
  color textColour, bgColour;
  boolean selected;
  
  InputBox(float x, float y, float w, float h, color tc, color bc){
    text = "";
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    textColour = tc;
    bgColour = bc;
    selected = false;
  }
  
  void onClick(){
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
      selected = true;
    }
    else{
      selected = false;
    }
  }
  
  void onKeyTyped(){
    if(selected){
      if(key != CODED){
        if(key == BACKSPACE){
          if(text.length() > 1){
            text = text.substring(0, text.length() - 1);
          }
        }
        else{
          text += key;
        }
      }
    }
  }
  
  void onDraw(){
    fill(bgColour);
    rect(x, y, w, h);
    fill(textColour);
    text(text, x, y, w, h);
  }
}

class Slider {
  float x, y, w, h;
  float min, max, current;
 
  Slider(float x, float y, float w, float h, float min, float max){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.min = min;
    this.max = max;
  }
  
}
