// IMPORT THE SPOUT LIBRARY
import spout.*;

// DECLARE A SPOUT OBJECT
Spout spout;

//square
float len = 10;
float angle = -270;
GenerateSquare[] squares = new GenerateSquare[100];
boolean direction = true;
boolean qieLan = true;
float rotateRatio = 30000.0;
float rotateRatio2 = 5000.0;
float increaseSpeed = 3.0;
float alpha = 255;
boolean tran = false;

//flocking
int RESOLUTION = 10;
int colorvalue = 0;
float increment = 5;
float bvalue = 100;
float alphavalue = 100;
float zoo = 1;
float b = 0;

void setup() {
  // Initial window size
  size(1280, 720, P3D);
  background(0);
  textureMode(NORMAL);
  // CREATE A NEW SPOUT OBJECT
  spout = new Spout(this);

  spout.createSender("Ana");
  
  for (int i = 0; i < squares.length; i++) {
    // squares.push( new GenerateSquare(windowWidth, windowHeight, length + i * (i + 0.005) , angle + i * PI / 1500.0 ) );
    // squares.push( new GenerateSquare(windowWidth, windowHeight, length + i , angle + i * PI / 1000.0 ) );//circle
    squares[i] = new GenerateSquare(width, height, len + i * (i + 0.005) , angle + i * PI / 5000.0, 255 );//tunnel
  }

  for (int i = 0; i < squares.length; i++) {
    GenerateSquare s = squares[i];
    s.display();
  }
  
} 

void draw()  { 

    background(0,0);
  
    //for (int i = 0; i < squares.length; i++) {
    //    GenerateSquare s = squares[i];
    //      s.transform(s.get_length(),s.get_angle() + PI/rotateRatio);
        
    //    s.display();
    //  }
    
      //-----------flocking---------
    //if (zoo>1){
    //  zoo-=0.1;
    //}
    //if(bvalue>255){
    //  b = 510 - bvalue;
    //}
    //else{
    //  b = bvalue;
    //}
    //if(bvalue>=510){
    //  bvalue = 0;
    //}
    ////console.log(b);
    //if(increment>0){
    //  if(colorvalue<255){
    //    fill(colorvalue,255-colorvalue,b,alphavalue);
    //  }
    //  else{
    //    increment=-5;
    //  }
    //}
    //else{
    //  if(colorvalue>0){
    //    fill(colorvalue,255-colorvalue,b,alphavalue);
    //  }
    //  else{
    //    increment=5;
    //  }
    //}
    //push();
    //blendMode(ADD);
    //drawWave(-30+zoo, 4+((zoo-1)*4), 0.01+zoo-1);
    //drawWave(-5+zoo, 4+((zoo-1)*5), 0.011+zoo-1);
    //drawWave(50+zoo, 4+((zoo-1)*6), 0.012+zoo-1);
    //pop();
    
    //-------circle---------
  if (qieLan){
    if(direction){
      for (int i = 0; i < squares.length; i++) {
        GenerateSquare s = squares[i];
        if (tran){
          s.transform(s.get_length() + increaseSpeed,s.get_angle() + PI/rotateRatio);
        }else{
          s.transform(s.get_length(),s.get_angle() + PI/rotateRatio);
        }

        s.display();
      }
    }else{
      for (int i = 0; i < squares.length; i++) {
        GenerateSquare s = squares[i];
        if (tran){
          s.transform(s.get_length() - increaseSpeed,s.get_angle() + PI/rotateRatio);
        }else{
          s.transform(s.get_length(),s.get_angle() + PI/rotateRatio);
        }
        s.display();
      }
    }
  }


    
    // OPTION 1: SEND THE TEXTURE OF THE DRAWING SURFACE
    // Sends at the size of the window    
    spout.sendTexture();
   
}

void keyPressed(){

  if (keyCode == 77) {
    direction = !direction;
  }

  if (keyCode == 49){
    qieLan = !qieLan;
  }

  if (qieLan){
    if (keyCode == 76) {
      tran = !tran;
    }
  }

  if(keyCode == ENTER){
    zoo = 3;
  }
}

void drawWave(float y,float diaMax,float value) {
  push();
  translate(0, y);

  float freq, amp;
  for (int x = 0; x < width; x += RESOLUTION) {

    // sin for xOffset
    freq = frameCount * value;
    amp = 100 * zoo;
    float sinXOffset = sin(freq) * amp;

    // sin for amp
    freq = (frameCount) * value;
    amp = 100;
    float sinAmp = noise(freq) * amp;

    // sin for freq
    freq = frameCount * value;
    amp = 0.01 * zoo;
    float sinFreq = sin(freq) * amp;

    // main sine wave
    freq = (x + sinXOffset) * sinFreq;
    amp = sinAmp;
    float sinValue = sin(freq) * amp;

    y = height / 2 + sinValue;
    float dia = random(1, diaMax);


    ellipse(x, y, dia, dia);
    ellipse(x, y, dia/2, dia/2);
    ellipse(x, y, dia/3, dia/3);
  }

  pop();
}
