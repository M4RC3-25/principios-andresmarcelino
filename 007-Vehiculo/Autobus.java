

/**
 * Class Autobus
 */
public class Autobus extends Vehiculo {

  //
  // Fields
  //

  private int numAsientos;
  private int numPuertas;
  private int numVentilas;
  
  //
  // Constructors
  //
  public Autobus(String marcaModelo, int precioDia, int numLlantas,int numAsientos, int numPuertas, int numVentilas) {
     super(marcaModelo, precioDia, numLlantas);
     this.numAsientos = numAsientos;
     this.numPuertas = numPuertas;
     this.numVentilas = numVentilas;
     }
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of numAsientos
   * @param newVar the new value of numAsientos
   */
  public void setNumAsientos (int newVar) {
    numAsientos = newVar;
  }

  /**
   * Get the value of numAsientos
   * @return the value of numAsientos
   */
  public int getNumAsientos () {
    return numAsientos;
  }

  /**
   * Set the value of numPuertas
   * @param newVar the new value of numPuertas
   */
  public void setNumPuertas (int newVar) {
    numPuertas = newVar;
  }

  /**
   * Get the value of numPuertas
   * @return the value of numPuertas
   */
  public int getNumPuertas () {
    return numPuertas;
  }

  /**
   * Set the value of numVentilas
   * @param newVar the new value of numVentilas
   */
  public void setNumVentilas (int newVar) {
    numVentilas = newVar;
  }

  /**
   * Get the value of numVentilas
   * @return the value of numVentilas
   */
  public int getNumVentilas () {
    return numVentilas;
  }

  //
  // Other methods
  //

  /**
   */
  public void mostrarDatos()
  {
  System.out.println("Autobus");
  mostrarCaracteristicas();
  System.out.println("Asientos: " + numAsientos);
  System.out.println("Puertas: " + numPuertas);
  System.out.println("Ventilas: " + numVentilas);
  }


  /**
   */
  public void pruebaDelMotor()
  {
  encenderMotor();
  System.out.println("Probando motor del autobus...");
  apagarMotor();
  }


}
