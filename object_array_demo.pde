int numObjects = 20;

Bubble[] glinda;

void setup(){
  size(400,400);
 
  glinda = new Bubble[numObjects];
  
  for (int i = 0; i < numObjects; i++){
    glinda[i] = new Bubble(width/2, height/2, 10, 10, 5, 5);
  }
}

void draw(){
  background(255);
  for (int i = 0; i < numObjects; i++){
  glinda[i].update();
  glinda[i].display();
  }
}

void mousePressed(){
  
 for (int i = 0; i < numObjects; i++){
  glinda[i].randColor();
 }
}

class Bubble{
  int xPos;
  int yPos;
  int w;
  int h;
  int xSpeed;
  int ySpeed;
  color bubColor;
  Bubble (int x, int y, int inW, int inH, int xS, int yS){
    xPos = x;
    yPos = y;
    w = inW;
    h = inH;
    xSpeed = xS;
    ySpeed = yS;
    bubColor = color(random(255),random(255),random(255));
  }
  void display(){
    fill(bubColor);
    ellipse(xPos, yPos, w, h);
  }
  void update(){
    xPos += random(-xSpeed, xSpeed);
    yPos += random(-ySpeed, ySpeed);
  }
  void randColor(){
    bubColor = color(random(255),random(255),random(255));
  }
}
