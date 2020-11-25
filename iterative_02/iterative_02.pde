ArrayList<DCurve> curves = new ArrayList<DCurve>();
void setup(){
size(800, 1200);

addDCurves(curves,200,40,40);
  
}

void draw(){
background(0,0,0);
noFill();
stroke(255,255,255);
strokeWeight(2);

  for(int i=0; i<curves.size(); i++){
      DCurve current= curves.get(i);
      curve(current.one.cpx1, current.one.cpx2, current.one.x1, current.one.y1, current.one.x2, current.one.y2, current.one.cpx2, current.one.cpy2);
      curve(current.two.cpx1, current.two.cpx2, current.two.x1, current.two.y1, current.two.x2, current.two.y2, current.two.cpx2, current.two.cpy2);
  }


}


class Curve{
  float cpx1, cpy1, x1,y1,x2,y2,cpx2,cpy2;
  Curve(float cpx10,float cpy10,float x10,float y10, float x20, float y20, float  cpx20, float cpy20){
      cpx1 = cpx10;
      cpy1 = cpy10;
      x1 = x10;
      y1 = y10;
      x2 = x20;
      y2 = y20;
      cpx2 = cpx20;
      cpy2 = cpy20;
  }
}

class DCurve{
  Curve one, two;
  int curveOneWeight, curveTwoWeight;
  DCurve(Curve curveOne, Curve curveTwo){
    one = curveOne;
    two= curveTwo;
  }
  void setcurveOneWeight(int weight){
    this.curveOneWeight = weight;
  }
  void setcurveTwoWeight(int weight){
    this.curveTwoWeight = weight;
  }
}

void addDCurves(ArrayList<DCurve> curves, int amount, float outGutter, float inGutter){
  float centerX= width/2;
  float centerY= height/2;
  for(int i=0; i<amount; i++){
    float x1= random(outGutter, centerX-inGutter);
    float x2 = random(centerX + inGutter, width-outGutter);
  Curve one = new Curve(x1-40, 40, x1, height, centerX, centerY, random(centerX, centerX+60), random(centerY, centerY-60));
  Curve two = new Curve (centerX+40, 40, centerX, centerY,x2, 0, random(x2, x2+60), random(-10, -70));
  DCurve toAdd= new DCurve(one, two);
  curves.add(toAdd);
  }
}

class DArc{

}
