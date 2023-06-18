//Alumno Brian Acosta
//Legajo 93084/2
//Comision 5


int numcolumnas = 8;    // Número de columnas de cuadrados
int numfilas = 14;      // Número de filas de cuadrados
int squareSize;        // Tamaño de cada cuadrado
PImage img;            // Variable para almacenar la imagen

void setup() {
  size(800, 400);
  colorMode(RGB, 255);  // Configura el modo de color a RGB para que sea byn
  img = loadImage("17m.jpg");
  squareSize = width/ (numcolumnas + 3);  
  // Calcula el tamaño de cada cuadrado en función del tamaño de la ventana y el número de columnas y filas
  // Añade 1 al número de columnas para dejar espacio para la imagen
}

void draw() {
  background(255); // Fondo blanco
  // Dibuja la imagen en el margen izquierdo
  image(img, 0, 0, squareSize, height);
  // Itera a traves de cada fila
  for (int row = 0; row < numfilas; row++) {
    // Itera a través de cada columna
    for (int col = 0; col < numcolumnas; col++) {
      // Calcula las coordenadas del cuadrado actual
      int x = (col + 1) * squareSize; // Añade 1 a col para dejar espacio para la imagen
      int y = row * squareSize;
      // Calcula los colores de inicio y fin del degradado para el cuadrado actual
      color startColor;
      color endColor;
      if (row % 2 == 0) {
        // Fila par: degradado de negro a blanco
        startColor = color(0);
        endColor = color(255);
      } else {
        // Fila impar: degradado de blanco a negro
        startColor = color(255);
        endColor = color(0);
      }
      // Dibuja el cuadrado con el degradado de color correspondiente
      drawSquareWithGradient(x, y, squareSize, startColor, endColor);
    }
  }
}

void drawSquareWithGradient(int x, int y, int size, color startColor, color endColor) {
  // Itera a través de cada columna del cuadrado
  for (int col = 0; col < size; col++) {
    // Calcula la posición normalizada dentro de la columna
    float position = map(col, 0, size - 1, 0, 1);
    // Interpola entre los colores de inicio y fin
    color lerpedColor = lerpColor(startColor, endColor, position);
    // Establece el color del píxel en la columna actual
    stroke(lerpedColor);
    line(x + col, y, x + col, y + size);
  }
}

void mouseMoved() {
  // Genera un efecto al pasar el mouse
  for (int row = 0; row < numfilas; row++) {
    for (int col = 0; col < numcolumnas; col++) {
      float randomValue = random(0.5, 1.5); // Ejemplo de uso de la función random()
      float distance = dist(mouseX, mouseY, (col + 1) * squareSize, row * squareSize); // Ejemplo de uso de la función dist()
      float mappedValue = map(distance, 0, width, 0, 1); // Ejemplo de uso de la función map()
      // Calcula los colores de inicio y fin del degradado para el cuadrado actual
      color startColor;
      color endColor;
      
      if (row % 2 == 0) {
        // Fila par: degradado de negro a blanco con efecto
        startColor = color(0);
        endColor = color(255 * randomValue * mappedValue);
      } else {
        // Fila impar: degradado de blanco a negro con efecto
        startColor = color(255 * randomValue * mappedValue);
        endColor = color(0);
      }
      
      // Dibuja el cuadrado con el degradado de color correspondiente
      drawSquareWithGradient((col + 1) * squareSize, row * squareSize, squareSize, startColor, endColor);
    }
  }
}
