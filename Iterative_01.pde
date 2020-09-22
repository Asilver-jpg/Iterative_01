float sw, alpha;
float yStep=10;
float arcSize=150;

void setup(){
size(800,800);
}

void draw(){
background(#eeeeee);
mouseX = constrain(mouseX,10,width);
mouseY = constrain(mouseY,10,height);

noFill();
stroke(20);
yStep=mouseY;
arcSize=mouseX;
  for(float y=arcSize/2; y<height -arcSize/2; y+=yStep){  
     sw = map(sin(radians(y+alpha)),-1,1,2,yStep);
     strokeWeight(sw);
     for(float x=0; x<width +arcSize; x+=arcSize){
       arc(x,y,arcSize/2, arcSize/2,0,PI); 
     }
        sw = map(sin(radians(y-alpha)),-1,1,2,yStep);
          strokeWeight(sw);
     for(float x2=0; x2<width+arcSize; x2+=arcSize){
              arc(x2+arcSize/2,y,arcSize/2, arcSize/2, PI, TWO_PI);

     }
  }
  alpha++;
}
