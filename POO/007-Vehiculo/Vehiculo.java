

/**
 * Class Vehiculo
 */
public class Vehiculo {

  //
  // Fields
  //

  protected int precioDia;
  protected String marcaModelo;
  protected int numLlantas;
  
  //
  // Constructors
  //
  public Vehiculo(String marcaModelo, int precioDia, int numLlantas) {
        this.marcaModelo = marcaModelo;
        this.precioDia = precioDia;
        this.numLlantas = numLlantas;
    }
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of precioDia
   * @param newVar the new value of precioDia
   */
  public void setPrecioDia (int newVar) {
    precioDia = newVar;
  }

  /**
   * Get the value of precioDia
   * @return the value of precioDia
   */
  public int getPrecioDia () {
    return precioDia;
  }

  /**
   * Set the value of marcaModelo
   * @param newVar the new value of marcaModelo
   */
  public void setMarcaModelo (String newVar) {
    marcaModelo = newVar;
  }

  /**
   * Get the value of marcaModelo
   * @return the value of marcaModelo
   */
  public String getMarcaModelo () {
    return marcaModelo;
  }

  /**
   * Set the value of numLlantas
   * @param newVar the new value of numLlantas
   */
  public void setNumLlantas (int newVar) {
    numLlantas = newVar;
  }

  /**
   * Get the value of numLlantas
   * @return the value of numLlantas
   */
  public int getNumLlantas () {
    return numLlantas;
  }

  //
  // Other methods
  //

  /**
   */
  public void mostrarCaracteristicas()
  {
  System.out.println("Modelo: " + marcaModelo);
  System.out.println("Precio por dia: " + precioDia);
  System.out.println("Numero de llantas: " + numLlantas);
  }


  /**
   */
  public void encenderMotor()
  {
  System.out.println("Motor encendido...");
  }


  /**
   */
  public void apagarMotor()
  {
  System.out.println("Motor apagado...");
  }


  /**
   */
  public void funciona()
  {
  }


}
