float  masseSoleil = 1989.0e27 ; 
float  rayonsoleil = 695.5e6 ; 

float  G = 6.67e-11;
float echelleDistances = 2.0e-9;
float echelleRayonSoleil = 1.0e-7; // facteur echelle rayon soleil
float echelleRayonsPlanetes = 1.0e-6; //facteur echelle rayon planete
float R = rayonsoleil*echelleRayonSoleil;
float dt = 5.0e4 ;

Planete[] Planetes = new Planete[10];

void setup() {
  size(displayWidth, displayHeight); 
  for (int i = 0; i < Planetes.length; i++) {
    Planetes[i] = new Planete( color(random(0, 255), random(0, 255), random(0, 255)));
    Planetes[i].vivre();
  }
}
void draw() {

  translate(width/2, height/2);
  fill(255, 255, 0);
  ellipse(0, 0, 2*R, 2*R);
  for (int i = 0; i < Planetes.length; i++) {
    Planetes[i].bouger();
    Planetes[i].vivre();
  }
}