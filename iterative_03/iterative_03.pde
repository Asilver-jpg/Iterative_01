PImage image;
float offset;
float maxOffset = 80;
float minOffset =1;
float numberRenderedPerLoop=6000;
float theta=0;
float period= 5;
float temp = 0;
boolean ascending = true;
boolean sinWave =false;

void settings() {
  image = loadImage("C:/Users/alex silver/Documents/Processing/Iterative_01/images/toucan.jpg");
  size(image.width, image.height);
}
void setup() {
  background(0);
  //larger offset works better with larger images
  offset=60;
}

void draw() {
  if (sinWave ==true) {
    float x = sin(radians(theta));
    if (x<0) {
      x*=-1;
    }
    if (ascending && x < temp) {
      ascending = !ascending; 
      period = random(.5, 20);
    } else if (!ascending && x > temp) {
      ascending = !ascending;
      period = random(.5, 20);
    }
    temp = x;
    offset = maxOffset * x;
    theta+=period;
  }
  for (int i = 0; i<3000; i++) {
    float shapePick = floor(random(1, 4));
    float x = random(width);
    float y = random(height);
    color c= image.get(int(x), int(y));
    noStroke();
    fill(c);
    if (shapePick == 1) {
      float diameter = random(10, offset);
      ellipse(x, y, diameter, diameter);
    } else if (shapePick==2) {
      float rectWidth = random(10, offset);
      float rectHeight = random(10, offset);
      rect(x, y, rectWidth, rectHeight);
    } else {
      float x2 = random(x, x+offset);
      float y2 = random(y, y+offset);
      float x3 = random(x, x-offset);
      float y3 = random(y, y+offset);
      triangle(x, y, x2, y2, x3, y3);
    }
  }
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode ==UP && offset<=maxOffset) {
      offset++;
    } else if (keyCode == DOWN && offset>=minOffset) {
      offset--;
      //this is the s key
    } else if (keyCode == RIGHT && sinWave==false) {
      sinWave =true;
    } else if (keyCode ==RIGHT && sinWave==true) {
      sinWave=false;
    }
  }
}
