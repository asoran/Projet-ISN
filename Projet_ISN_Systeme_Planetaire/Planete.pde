class Planete {
  // Propriétés
  float vitInit, masse, rayon;
  color c, d;
  PVector vectPosition, vectVitesse, vectAccel, vectG;

  // Constructeur par défaut
  Planete(color c) {
    vectPosition = new PVector(random(50, 350) * pow(10, 9), 0);
    vectVitesse = new PVector(0, random(0, 30) * pow(10, 3)*echelleDistances);
    vectAccel = new PVector();
    masse = 2;
    rayon = 6.378e6;
    d = c;
  }

  void vivre() {
    fill(d);
    ellipse(vectPosition.x*echelleDistances, vectPosition.y, 2*rayon*echelleRayonsPlanetes, 2*rayon*echelleRayonsPlanetes);
  }
  void bouger( ) {
    for (int i = 0; i < Planetes.length; i++) {
      if (i!=Planetes.length-1 && vectPosition!=Planetes[i].vectPosition) {
        vectG = new PVector(vectPosition.x-Planetes[i].vectPosition.x, vectPosition.y-Planetes[i].vectPosition.y, vectPosition.z-Planetes[i].vectPosition.z);
        vectAccel.add(( PVector.mult(PVector.mult(vectG, -G), ( (Planetes[i].masse/pow(vectG.mag(), 3)) )) ));
      } else { 
        vectAccel.add(PVector.mult(PVector.mult(vectPosition, -G), ( (masseSoleil/pow(vectPosition.mag(), 3)) )));
      }
    }
    vectVitesse.add(PVector.mult(vectAccel, dt));
    vectPosition.add(PVector.mult(vectVitesse, dt));
  }
}