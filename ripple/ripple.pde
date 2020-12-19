// IMPORT THE SPOUT LIBRARY
import spout.*;

// DECLARE A SPOUT OBJECT
Spout spout;

int cols = 640;
int rows = 360;
float[][][] current = new float[cols][rows][3];
float[][][] previous = new float[cols][rows][3];
float r,g,b = 255;
float damping = 0.99;

void setup(){
  size(640,360,P3D);
  //previous[100][100][] = 255;
  //previous[200][200][] = 255;
  textureMode(NORMAL);
  // CREATE A NEW SPOUT OBJECT
  spout = new Spout(this);

  spout.createSender("ripple");
}

void mousePressed(){
    
  }
  
void keyPressed(){
  if(key == ENTER){
    //print("clicked");
    r = random(255);
    g = random(255);
    b = random(255);
    int x = int(random(100,540));
    int y = int(random(100,260));
    previous[x][y][0] = r;
    previous[x][y][1] = g;
    previous[x][y][2] = b;
  }
}

void draw(){
  background(0);
  loadPixels();
  

  for(int i = 1;i < cols-1;i++){
    for(int j = 1;j < rows-1;j++){
      for(int c = 0;c<3;c++){
        current[i][j][c] = (previous[i-1][j][c]+previous[i+1][j][c]+ previous[i][j-1][c]+previous[i][j+1][c])/2 -current[i][j][c];
        current[i][j][c]*=damping;
      }
      

      
      int index = i + j * cols;
      pixels[index] = color(current[i][j][0]*100,current[i][j][1]*100,current[i][j][2]*100);
    }
  }
  
  
  updatePixels();
  float[][][] temp = previous;
  previous = current;
  current = temp;
  
  spout.sendTexture();
  
}
