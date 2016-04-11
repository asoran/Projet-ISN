float  masseSoleil = 1989.0e27 ; 
float  rayonSoleil = 695.5e6 ; 

float  G = 6.67e-11;
float echelleDistances = 2.0e-9;
float echelleRayonSoleil = 5.0e-8; // facteur echelle rayon soleil
float echelleRayonsPlanetes = 1.0e-6; //facteur echelle rayon planete
float R = rayonSoleil*echelleRayonSoleil;
float dt = 5.0e4 ;
int nbPlanetes = 20;
float mvTerre = 5510.0; //Masse volimique de la terre = 5510kg/m^3

Planete[] Planetes = new Planete[nbPlanetes];

void setup() {
  size(displayWidth, displayHeight); 
  for (int i = 0; i < Planetes.length; i++) {
    //Planetes[i] = new Planete( color(random(0, 255), random(0, 255), random(0, 255)));
    // Test de la Terre   
    //Planetes[i] = new Planete(new PVector(149.7e9,0.0),new PVector(0, -29.8e3), 5.9742e24, color(0,0,255));

    Planetes[i] = new Planete(
      new PVector(random(50, 350) * pow(10, 9), 0.0), //Position
      new PVector(0, random(20, 40) * pow(10, 3)), // Vitesse
      random(2, 15) * pow(10, 24), // Masse
      color(random(0, 255), random(0, 255), random(0, 255)) //couleur
      );
      //println(2*Planetes[i].rayon*echelleRayonsPlanetes);
  }
}
void draw() {
  background(0);
  translate(width/2, height/2);
  fill(255, 255, 0);
  // Soleil
  ellipse(0, 0, 2*R, 2*R);
  for (int i = 0; i < Planetes.length; i++) {
    Planetes[i].bouger();
    Planetes[i].afficher();
  }
}