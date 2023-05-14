
PImage imagena;
PImage imagenb;
PImage imagenc;
int estado;
int margen = 10;
void setup() {
  size(640, 480);
  imagena = loadImage("imagena.jpg");
  imagenb = loadImage("imagenb.jpg");
  imagenc = loadImage("imagenc.jpg");
  estado = 0;
}

void draw() {
  background(255);
  if (estado == 0) {
    image(imagena,margen,margen, width - margen*2,height - margen*2);
    fill(255, 200, 120);
    textSize(30);
    text("Las Herramientas de mi viejo", 10, 40);
  } else if (estado == 1) {
    image(imagenb,margen,margen, width - margen*2,height - margen*2);
    fill(0, 255, 150);
    textSize(40);
    textFont(createFont("Georgia", 48));
    textAlign(CENTER, CENTER);
    text("Las utiliza en su taller", width/2, height/2);
  } else if (estado == 2) {
    image(imagenc,margen,margen, width - margen*2,height - margen*2);
    fill(100, 0, 255);
    textSize(20);
    textMode(SHAPE);
    translate(width/2, height/2);
    rotate(radians(45));
    scale(2);
    text("Son indispensables para él", 0, 0);
    filter(BLUR,1);
  image(imagenb, width/2, 0);
  tint(150, 0, 0, 128);
  image(imagenc, width/4, height/2);
  }
}
void mousePressed() {

 estado = (estado + 1) % 3;
}
