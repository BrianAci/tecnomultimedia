// Variables globales
int currentScreen = 0;
String[] textScreens = {
  "Había una vez un molinero que tenía tres hijos. Cuando el molinero murió, le dejó a su hijo más joven el único legado que tenía: un gato.",
  "El joven no sabía qué hacer con un simple gato, pero el gato con botas tenía un plan. El gato con botas se acercó al joven y le dijo: 'No te preocupes, amo. Si sigues mis instrucciones, podrás lograr grandes cosas'.",
  "El gato con botas llevó al joven al bosque y le dijo que recogiera una bolsa llena de ratones. Luego, el gato se puso las botas y saltó sobre los ratones, capturándolos uno por uno. El joven se asombró de las habilidades del gato.",
  "El gato con botas llevó a su amo al castillo del rey. Allí, le dijo al joven que se presentara como el Marqués de Carabás. El joven siguió las instrucciones del gato y se ganó el favor del rey con su presencia y su aparente riqueza.",
  "El gato con botas ideó un plan para engañar al rey y hacerle creer que el joven era el dueño de tierras y propiedades. Con astucia y habilidad, el gato convenció a los campesinos de que dijeran al rey que las tierras pertenecían al Marqués de Carabás.",
  "El rey, impresionado por la supuesta riqueza del joven, le ofreció la mano de su hija en matrimonio. El joven, ahora convertido en el Marqués de Carabás, se casó con la princesa y vivieron felices para siempre.",
  "Fin 1: 'Molino Rico' - El joven, agradecido por la ayuda del gato con botas, decidió usar su nueva posición para mejorar la vida de los campesinos. Con su influencia, construyó un molino moderno que benefició a todos. El reino prosperó y el joven Marqués de Carabás se convirtió en un líder amado y respetado.",
  "Fin 2: 'Gato Rico' - El joven Marqués de Carabás, ahora casado con la princesa, le dio a su fiel gato con botas una vida de lujo. El gato disfrutó de comidas abundantes, camas suaves y una vida de ocio. Se convirtió en el gato más famoso y querido del reino, siendo celebrado y adorado por todos.",
  "Fin 3: 'Gato Devorado' - El joven Marqués de Carabás, en su arrogancia y ambición, decidió deshacerse del gato con botas después de lograr su posición y riqueza. Sin embargo, sin la ayuda y el consejo del gato, el joven pronto perdió todo lo que había conseguido. Fue olvidado y quedó en la pobreza, mientras que el gato con botas encontró un nuevo amo y continuó su vida de aventuras.",
  "Volver al inicio - Si deseas volver al inicio de la historia, haz clic aquí.",
  "Créditos - Alumno: [Nombre del alumno]",
  "Créditos - Autor de la obra: [Nombre del autor]"
};

PImage[] images;

void setup() {
  size(600, 600);
  
  // Carga las imágenes desde archivos locales
  images = new PImage[12]; // Número total de imágenes
  for (int i = 0; i < 12; i++) {
    images[i] = loadImage("pantalla_" + i + ".png"); // Reemplaza "pantalla_" + i + ".png" con los nombres de tus imágenes, pero no me deja mostrar las elegidas
  }
}

void draw() {
  background(255);
  
  // Muestra la imagen correspondiente a la pantalla actual
  image(images[currentScreen], 0, 0, width, height);
  
  // Dibuja el texto narrativo en la pantalla actual
  fill(0);
  textSize(20);
  textAlign(LEFT);
  text(textScreens[currentScreen], 50, 50, 500, 500);
}

void mousePressed() {
  // Avanza a la siguiente pantalla al hacer clic en cualquier parte de la pantalla
  currentScreen++;
  
  // Si se llega al final, vuelve al inicio
  if (currentScreen >= textScreens.length) {
    currentScreen = 0;
  }
}

void keyPressed() {
  // Reiniciar la historia si se presiona la tecla "R"
  if (key == 'r' || key == 'R') {
    currentScreen = 0;
  }
}
