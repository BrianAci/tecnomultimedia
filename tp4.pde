//Brian Acosta Comision 5 Profesor: Tobias Albirrosa
//Juego Breakout
//https://youtu.be/mDE7uJcHNZc

int estadoJuego = 0; // 0: Pantalla de inicio, 1: Juego, 2: Pantalla de finalización
int totalLadrillos;  // Total de ladrillos al inicio del juego
// Variables del juego
int anchoPaleta = 80;
int altoPaleta = 10;
float posXPaleta;
float posXPelota, posYPelota, velocidadXPelota, velocidadYPelota;
int filasLadrillos = 3;
int columnasLadrillos = 5;
int anchoLadrillo;
int altoLadrillo;
boolean[][] ladrillos;
int puntaje = 0;
color colorLadrillo; // Color de los ladrillos
color colorPelota;  // Color de la pelota
color colorTexto;    // Color del texto

void setup() {
  size(800, 400);
  anchoLadrillo = width / (columnasLadrillos + 2); // +2 para centrar los ladrillos horizontalmente
  altoLadrillo = 30;
  ladrillos = new boolean[filasLadrillos][columnasLadrillos];
  posXPaleta = width / 2 - anchoPaleta / 2;
  posXPelota = width / 2;
  posYPelota = height / 2;
  velocidadXPelota = random(2, 4) * (random(1) > 0.5 ? 1 : -1);
  velocidadYPelota = -3;

  totalLadrillos = filasLadrillos * columnasLadrillos;

  colorLadrillo = color(255, 0, 0); // Rojo para los ladrillos
  colorPelota = color(0, 0, 255);  // Azul para la pelota
  colorTexto = color(255);        // Blanco para el texto
  inicializarLadrillos();
}

void inicializarLadrillos() {
  for (int i = 0; i < filasLadrillos; i++) {
    for (int j = 0; j < columnasLadrillos; j++) {
      ladrillos[i][j] = true;
    }
  }
}

void draw() {
  background(0);

  if (estadoJuego == 0) {
    // Pantalla de inicio
    mostrarInstrucciones();
  } else if (estadoJuego == 1) {
    // Juego
    jugar();
  } else if (estadoJuego == 2) {
    // Pantalla de finalización
    if (puntaje == totalLadrillos) {
      mostrarVictoria();
    } else {
      mostrarGameOver();
    }
  }
}

void mostrarInstrucciones() {
  background(0);

  fill(colorTexto);
  textSize(24);
  textAlign(CENTER, CENTER);
  text("Instrucciones:", width / 2, height / 2 - 30);
  textSize(20);
  text("Mueve la paleta con el mouse.", width / 2, height / 2);
  text("Haz clic para empezar.", width / 2, height / 2 + 30);

  // Dibuja el botón de inicio
  fill(50, 150, 255); // Color azul claro
  rect(width / 2 - 50, height / 2 + 70, 100, 40);
  fill(colorTexto);
  textSize(20);
  text("Inicio", width / 2, height / 2 + 90);
}

void jugar() {
  // Actualiza la posición de la pelota
  posXPelota += velocidadXPelota;
  posYPelota += velocidadYPelota;

  // Dibuja los ladrillos y maneja las colisiones con la pelota
  for (int i = 0; i < filasLadrillos; i++) {
    for (int j = 0; j < columnasLadrillos; j++) {
      if (ladrillos[i][j]) {
        fill(colorLadrillo);
        rect(j * anchoLadrillo + anchoLadrillo, i * altoLadrillo + 50, anchoLadrillo, altoLadrillo);
        
        // Colisión con los ladrillos
        float ladrilloX = j * anchoLadrillo + anchoLadrillo;
        float ladrilloY = i * altoLadrillo + 50;
        if (posXPelota > ladrilloX && posXPelota < ladrilloX + anchoLadrillo && posYPelota > ladrilloY && posYPelota < ladrilloY + altoLadrillo) {
          ladrillos[i][j] = false;
          velocidadYPelota *= -1;
          puntaje++;

          // Verifica si se han roto todos los ladrillos
          if (puntaje == totalLadrillos) {
            estadoJuego = 2; // Cambia al estado de victoria
          }
        }
      }
    }
  }

  // Dibuja la paleta
  fill(colorTexto);
  rect(posXPaleta, height - altoPaleta, anchoPaleta, altoPaleta);

  // Dibuja la pelota
  fill(colorPelota);
  ellipse(posXPelota, posYPelota, 20, 20);

  // Dibuja el puntaje
  textSize(24);
  textAlign(RIGHT, TOP);
  fill(colorTexto);
  text("Puntaje: " + puntaje, width - 20, 10);

  // Lógica de rebote de la pelota en los bordes
  if (posXPelota < 0 || posXPelota > width) {
    velocidadXPelota *= -1; // Invierte la dirección en el eje X
  }
  if (posYPelota < 0) {
    velocidadYPelota *= -1; // Invierte la dirección en el eje Y
  }

  // Lógica de derrota si la pelota cae fuera de la pantalla
  if (posYPelota > height) {
    estadoJuego = 2; // Cambia al estado de juego terminado
  }

  // Lógica de rebote de la pelota en la paleta
  if (posYPelota > height - altoPaleta && posXPelota > posXPaleta && posXPelota < posXPaleta + anchoPaleta) {
    velocidadYPelota *= -1; // Invierte la dirección en el eje Y
  }

  // Mueve la paleta con el mouse
  posXPaleta = constrain(mouseX - anchoPaleta / 2, 0, width - anchoPaleta);
}

void mostrarGameOver() {
  fill(colorTexto);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("¡Juego Terminado!", width / 2, height / 2);
  text("Puntaje: " + puntaje, width / 2, height / 2 + 40);

  // Dibuja el botón de reinicio
  fill(50, 150, 255);
  rect(width / 2 - 50, height / 2 + 70, 100, 40);
  fill(colorTexto);
  textSize(20);
  text("Reiniciar", width / 2, height / 2 + 90);
}

void mostrarVictoria() {
  fill(colorTexto);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("¡Has Ganado!", width / 2, height / 2);
  text("Puntaje: " + puntaje, width / 2, height / 2 + 40);

  // Dibuja el botón de reinicio
  fill(50, 150, 255);
  rect(width / 2 - 50, height / 2 + 70, 100, 40);
  fill(colorTexto);
  textSize(20);
  text("Reiniciar", width / 2, height / 2 + 90);
}

void mousePressed() {
  if (estadoJuego == 0) {
    if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 &&
        mouseY > height / 2 + 70 && mouseY < height / 2 + 110) {
      // Clic en el botón de inicio
      estadoJuego = 1; // Cambiar al estado del juego
    }
  } else if (estadoJuego == 2) {
    if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 &&
        mouseY > height / 2 + 70 && mouseY < height / 2 + 110) {
      // Clic en el botón de reinicio
      estadoJuego = 0; // Volver a la pantalla de inicio
      reiniciarJuego();
    }
  }
}

void reiniciarJuego() {
  posXPaleta = width / 2 - anchoPaleta / 2;
  posXPelota = width / 2;
  posYPelota = height / 2;
  velocidadXPelota = random(2, 4) * (random(1) > 0.5 ? 1 : -1);
  velocidadYPelota = -3;
  puntaje = 0;

  inicializarLadrillos();

  estadoJuego = 0;
}
