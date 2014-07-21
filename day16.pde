import java.util.Calendar;
import gifAnimation.*;

GifMaker gifExport;

float num = 0;
float quantity = 30;
color c;
 
void setup(){
  size(500, 500);
  c = color(drawColor());
  
  frameRate(12);
  gifExport = new GifMaker(this, "hypno.gif");
  gifExport.setRepeat(0);
  gifExport.setDelay(1000/12); 
}
 
void draw(){
  fill(#242424, 20);
  rect(0, 0, width, height);
  
  /* Smaller the number the slower the effect */
  num += 0.02;
  pushMatrix();
  translate(width/2, height/2);
  rotate(num);
  for(int i = 0; i < 360; i+=quantity){
    float x = sin(radians(i))*100;
    float y = cos(radians(i))*100;
//    stroke(i, x, y);
  stroke(255);
    strokeWeight(1);
    pushMatrix();
    translate(x, y);
    
    rotate(num);
    line(0, 0, x, y);

    rotate(num/3);
    translate(x, y);
    line(0, 0, x, y);
    
    rotate(num/8);
    translate(x/2, y/2);
    line(0, 0, x/2, y/2);
    
    popMatrix();
    
    pushMatrix();
    rotate(-num*2);
    noFill();
    ellipse(0, 0, x, y);
    popMatrix();
  }
  popMatrix();
  
  gifExport.addFrame();

  if (frameCount == 240) gifExport.finish(); 
}

color drawColor() {
  color c = color(random(50, 200), random(20, 120), random(20, 1500));
  return c;
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

void mousePressed(){
 c = color(drawColor()); 
}

