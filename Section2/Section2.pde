int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 2;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/

float mid (float a1, float a2){
  return (a1 + a2) / 2;
}

void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    
    fill(255,0,0);
    if (levels == 0){
      triangle(v1x, v1y, v2x, v2y, v3x, v3y);
    } else {
      float x1 = mid(v1x, v2x);
      float y1 = mid(v1y, v2y);
      float x2 = mid(v2x, v3x);
      float y2 = mid(v2y, v3y);
      float x3 = mid(v1x, v3x);
      float y3 = mid(v1y, v3y);
      gasket(levels-1, x2, y2, x3, y3, v3x, v3y);
      gasket(levels-1, x1, y1, v1x, v1y, x3, y3);
      gasket(levels-1, v2x, v2y, x1, y1, x2, y2);
    }
   }
    

void draw() { 
  background(0);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels",20,20);
  gasket(levels, 0, height-10, width, height-10, width/2, 10);
  

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
