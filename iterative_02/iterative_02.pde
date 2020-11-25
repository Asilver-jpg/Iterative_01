void setup(){
size(800, 1200);
}

void draw(){
background(0,0,0);


}


class Curve{
  int cpx1, cpy1, x1,y1,x2,y2,cpx2,cpy2;
  Curve(int cpx10,int cpy10,int x10,int y10, int x20, int y20, int  cpx20, int cpy20){
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


class DArc{

}
