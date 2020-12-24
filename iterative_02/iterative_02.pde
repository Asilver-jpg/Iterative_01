ArrayList<Curve> curves = new ArrayList<Curve>();
float outGutter = 0;
float inGutter=0;
void setup() {
  size(1000, 1000);
  
  addCurves(curves, 350, outGutter, inGutter);
}

void draw() {
  background(0, 0, 0);
  noFill();
  stroke(255, 255, 255);
  strokeWeight(3);

  stroke(255, 255, 255, 10);
   

  for (int i=0; i<curves.size(); i++) {
    Curve current= curves.get(i);
    current.changeOpacity();
    stroke(255,255,255, current.opacity);
    strokeWeight(current.weight);
    current.drawCurve(0, 0, 0);      
    current.drawCurve(width, width+1, 180);
  }
}



class Curve {
  float cpx1, cpy1, x1, y1, x2, y2, cpx2, cpy2;
  float weight, angle, angleOffset, period , opacity, maxOpacity;
  Curve(float cpx10, float cpy10, float x10, float y10, float x20, float y20, float  cpx20, float cpy20) {
    cpx1 = cpx10;
    cpy1 = cpy10;
    x1 = x10;
    y1 = y10;
    x2 = x20;
    y2 = y20;
    cpx2 = cpx20;
    cpy2 = cpy20;
    //this. period = TWO_PI / random(1,20);
    this.period= random(3,15);
    this.opacity= random(80,100);
    this.maxOpacity= this.opacity;
    this.angle = 1;
  }
 
  void drawCurve(int xTrans, int yTrans, int rotation) {
    pushMatrix();
    translate(xTrans, yTrans);
    rotate(radians(rotation));
    curve(this.cpx1, this.cpx2, this.x1, this.y1, this.x2, this.y2, this.cpx2, this.cpy2);
    popMatrix();
  }
  void setWeight(float val){
    this.weight= val;
  }
  void setOpacity(float val){
    this.opacity=val;
  }
  void changeOpacity(){
    float x = sin(radians(this.angle));
    if(x<0){
    x *= -1;
    }
    this.setOpacity(maxOpacity * x);
    this.angle += this.period;
  }
}



//median for curve 
//  curve(-1400, height/2-300 , width/2, height/2, width-20, 0, 400, 0 );


void addCurves(ArrayList<Curve> curves, int amount, float outGutter, float inGutter) {
  float centerX= width/2;
  float centerY= height/2;
  for (int i=0; i<amount; i++) {
    float x2 = random(centerX + inGutter, width-outGutter);
    //Curve one = new Curve(x1, 2000, x1, height, centerX, centerY, random(1000,1100), random(centerY+300, centerY+800));
    Curve toAdd = new Curve (-1400, centerY-300, centerX, centerY, x2, 0, random(400, 800), random(0, 20));
    curves.add(toAdd);
  }
}
