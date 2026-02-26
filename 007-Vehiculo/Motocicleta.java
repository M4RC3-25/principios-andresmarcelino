

/**
 * Class Motocicleta
 */
public class Motocicleta extends Vehiculo {

  //
  // Fields
  //

  private int numAsientos;
  
  //
  // Constructors
  //
 public Motocicleta(String marcaModelo, int precioDia, int numLlantas, int numAsientos) {
 super(marcaModelo, precioDia, numLlantas);
 this.numAsientos = numAsientos;
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

  //
  // Other methods
  //

  /**
   */
  public void mostrarDatos()
  {
  System.out.println("Motocicleta");
  mostrarCaracteristicas();
  System.out.println("Asientos: " + numAsientos);
  }


  /**
   */
  public void pruebaDelMotor()
  {
  encenderMotor();
  System.out.println("Probando motor de la motocicleta...");
  apagarMotor();
  }


}
