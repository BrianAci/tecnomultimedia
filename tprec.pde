//ALUMNO ACOSTA BRIAN 
//COMISION NRO 5 
//PROFESOR TOBIAS
// https://youtu.be/ZiIfOnwQZ7Y
PImage[] imagenes = new PImage[13]; // Arreglo para almacenar las imágenes
String[] textos = new String[13]; // Arreglo para almacenar los textos
int pantallaActual = 0; // Índice de la pantalla actual
int tiempoInicio; // Tiempo en que se inicia cada pantalla

void setup() {
  size(1024, 1024);
  for (int i = 0; i < 13; i++) {
    imagenes[i] = loadImage("letra_" + (i + 1) + ".jpg"); // Cargar imágenes numeradas
   switch (i) {
      case 0:
        textos[i] = "COMIENZO " + (i + 1);
        break;
      case 1:
        textos[i] = "Había una vez un molinero que tenía tres hijos. Cuando el molinero murió, le dejó a su hijo más joven el único legado que tenía: un gato.";
        break;
      case 2:
        textos[i] = "El joven no sabía qué hacer con un simple gato, pero el gato con botas tenía un plan. El gato con botas se acercó al joven y le dijo: 'No te preocupes, amo. Si sigues mis instrucciones, podrás lograr grandes cosas'.";
        break;
      case 3:
        textos[i] = "El gato con botas llevó al joven al bosque y le dijo que recogiera una bolsa llena de ratones. Luego, el gato se puso las botas y saltó sobre los ratones, capturándolos uno por uno. El joven se asombró de las habilidades del gato";
        break;
      case 4:
        textos[i] = "El gato con botas llevó a su amo al castillo del rey. Allí, le dijo al joven que se presentara como el Marqués de Carabás. El joven siguió las instrucciones del gato y se ganó el favor del rey con su presencia y su aparente riqueza";
        break;
      case 5:
        textos[i] = "El gato con botas ideó un plan para engañar al rey y hacerle creer que el joven era el dueño de tierras y propiedades. Con astucia y habilidad, el gato convenció a los campesinos de que dijeran al rey que las tierras pertenecían al Marqués de CarabásSi sigues mis instrucciones, podrás lograr grandes cosas'.";
        break;
      case 6:
        textos[i] = "El rey, impresionado por la supuesta riqueza del joven, le ofreció la mano de su hija en matrimonio. El joven, ahora convertido en el Marqués de Carabás, se casó con la princesa y vivieron felices para siempre'.";
        break;
      case 7:
        textos[i] = "Fin 1: 'Molino Rico' - El joven, agradecido por la ayuda del gato con botas, decidió usar su nueva posición para mejorar la vida de los campesinos. Con su influencia, construyó un molino moderno que benefició a todos. El reino prosperó y el joven Marqués de Carabás se convirtió en un líder amado y respetado'.";
        break;
      case 8:
        textos[i] = "Fin 2: 'Gato Rico' - El joven Marqués de Carabás, ahora casado con la princesa, le dio a su fiel gato con botas una vida de lujo. El gato disfrutó de comidas abundantes, camas suaves y una vida de ocio. Se convirtió en el gato más famoso y querido del reino, siendo celebrado y adorado por todos.";
        break;
      case 9:
        textos[i] = "Fin 3: 'Gato Devorado' - El joven Marqués de Carabás, en su arrogancia y ambición, decidió deshacerse del gato con botas después de lograr su posición y riqueza. Sin embargo, sin la ayuda y el consejo del gato, el joven pronto perdió todo lo que había conseguido. Fue olvidado y quedó en la pobreza, mientras que el gato con botas encontró un nuevo amo y continuó su vida de aventuras.";
        break;
       case 10:
        textos[i] = "'.";
        break;
      case 11:
        textos[i] = "a'.";
        break;
      case 12:
        textos[i] = "E'.";
        break;   
      default:
        textos[i] = "Texto de la pantalla " + (i + 1);
        break;
  }
  tiempoInicio = millis(); // Iniciar contador de tiempo
}
}
void draw() {
  background(255);
  image(imagenes[pantallaActual], 0, 0, width, height); // Mostrar imagen
  
  fill(0);
  textSize(18);
  textAlign(CENTER, CENTER);
  text(textos[pantallaActual], width/2, height/2); // Mostrar texto
  
  int tiempoActual = millis();
  if (tiempoActual - tiempoInicio >= 10000) { // Cambiar de pantalla cada 10 segundos
    siguientePantalla();
    tiempoInicio = tiempoActual;
  }
  
  if (pantallaActual == 12) { // Última pantalla
    mostrarBotonReinicio();
  }
}

void siguientePantalla() {
  pantallaActual++;
  if (pantallaActual >= 13) {
    pantallaActual = 0; // Volver al inicio
  }
}

void mostrarBotonReinicio() {
  fill(255);
  rect(width/2 - 50, height/2 - 25, 100, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Reiniciar", width/2, height/2);
}

void mouseClicked() {
  if (pantallaActual == 12 && mouseX > width/2 - 50 && mouseX < width/2 + 50 &&
      mouseY > height/2 - 25 && mouseY < height/2 + 25) {
    pantallaActual = 0; // Reiniciar al hacer clic en el botón
    tiempoInicio = millis();
  }
}
