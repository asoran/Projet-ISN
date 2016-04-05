Table table ;

void setup() {
  table = loadTable("Planètes.csv" ," header ");
  
  for (TableRow row : table.rows()) {
    
    
    String  Nom = row.getString("Nom");
    Float Distance = row.getFloat("Distance");
    Float Masse = row.getFloat("Masse");
    Float Rayon = row.getFloat("Rayon");
    int Nombredelignes = row.getInt("Nombredelignes");
    
    println(Nom + " est à une distance de " + Distance + " mètres du Soleil, possède une masse de " + Masse +
    " kg et a  un rayon de "+ Rayon +" mètres." );
  }
  
}
    