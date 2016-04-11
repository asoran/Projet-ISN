class Planete {
  // Propriétés
  float vitInit, masse, rayon;
  color c, d;
  PVector vectPosition, vectVitesse, vectAccel, vectDistance;

  // Constructeur par défaut
  Planete(color c) {
    vectPosition = new PVector(random(50, 350) * pow(10, 9), 0);
    vectVitesse = new PVector(0, random(0, 30) * pow(10, 3));
    vectAccel = new PVector();
    masse = 2;
    rayon = 6.378e6;
    d = c;
  }
  Planete(PVector arg_vectPosition, PVector arg_vectVitesse, float arg_masse, color arg_c) {
    vectPosition = arg_vectPosition;
    vectVitesse = arg_vectVitesse;
    masse = arg_masse;
    rayon = pow((3*(arg_masse/mvTerre)/(4*PI)), 1.0/3);
    d = arg_c;
    vectAccel = new PVector();
  }

  void afficher() {
    fill(d);
    //destruction();
    ellipse(vectPosition.x*echelleDistances, vectPosition.y*echelleDistances, 2*rayon*echelleRayonsPlanetes, 2*rayon*echelleRayonsPlanetes);
  }
  void bouger( ) {
    // On calcule l'accélération due au Soleil toujours existante
    vectAccel = PVector.mult(PVector.mult(vectPosition, -G), ( (masseSoleil/pow(vectPosition.mag(), 3)) ));
    // On ajoute éventuellement les accélération dues aux autres planètes
    vectDistance = new PVector();
    for (int i = 0; i < Planetes.length; i++) {
      // On exclut l'instance de la planète
      if (Planetes[i] != this) {
        // On calcule le vecteur distance entre la planète et chacune des autres
        vectDistance = PVector.sub(vectPosition, Planetes[i].vectPosition);
        // On applique Newton 
        vectAccel.add(( PVector.mult(PVector.mult(vectDistance, -G), ( (Planetes[i].masse/pow(vectDistance.mag(), 3)) )) ));
      }
    }
    // On intègre l'accélération pour trouver la vitesse réelle
    vectVitesse.add(PVector.mult(vectAccel, dt));
    // On intègre la vitesse pour trouver la position réelle
    vectPosition.add(PVector.mult(vectVitesse, dt));
  }
  void destruction() {
    if (vectPosition.x <= rayonSoleil && vectPosition.y <= rayonSoleil) {
      Planetes = null;
    }
  }
}