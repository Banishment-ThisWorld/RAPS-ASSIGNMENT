class GenerateSquare {
  
  float x;
  float y;
  float len;
  float ang;
  float a;
  
    GenerateSquare(float xP,float yP,float leng,float angle, float alpha) {
    x = xP;
    y = yP;
    len = leng;
    ang = angle;
    a = alpha;
  }
  float get_length() {
    return len;
  }
  float get_angle() {
    return ang;
  }
  void transform(float leng,float angle) {
    len = leng;
    ang = angle;
  }
  void display() {
    // stroke(255);
    // stroke(120*(1+sin(frameCount/200)),120*(1+sin(frameCount/800)),122*(1+sin(frameCount/400)),122+(1+cos(frameCount/400)));
    stroke(120*(1.5+sin(frameCount/200)),120*(1.4+sin(frameCount/800)),122*(1.7+sin(frameCount/400)), a);
    strokeWeight(1.5);
    noFill();
    translate(x / 2, y / 2);
    rotate(ang);
    square(-len/2, -len/2, len);
    square(len*9/20, -len/2, len/20);
    square(-len/2, -len/2, len/20);
    line(-len/2, -len/2, -len*9/20, -len*9/20);
    line(-len/2, -len*9/20, -len*9/20, -len/2);
    line(-len/2, -len*9/20, len/2, -len*9/20);
    rect(len*37/80, -len*12/25, len/40, len/100);
    translate(-x/2, -y/2);
    //print(1);
  }
}
