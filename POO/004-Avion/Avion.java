

/**
 * Class Avion
 */
public class Avion {

  //
  // Fields
  //

  public String aerolinea;
  public String capacidad;
  protected String velocidad;
  private String cantidaddemotores;
  private String avion;
  
  //
  // Constructors
  //
  public Avion (String avion) {
  this.avion = avion; 
  System.out.println(avion);
  };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of aerolinea
   * @param newVar the new value of aerolinea
   */
  public void setAerolinea (String newVar) {
    aerolinea = newVar;
  }

  /**
   * Get the value of aerolinea
   * @return the value of aerolinea
   */
  public String getAerolinea () {
    return aerolinea;
  }

  /**
   * Set the value of capacidad
   * @param newVar the new value of capacidad
   */
  public void setCapacidad (String newVar) {
    capacidad = newVar;
  }

  /**
   * Get the value of capacidad
   * @return the value of capacidad
   */
  public String getCapacidad () {
    return capacidad;
  }

  /**
   * Set the value of velocidad
   * @param newVar the new value of velocidad
   */
  public void setVelocidad (String newVar) {
    velocidad = newVar;
  }

  /**
   * Get the value of velocidad
   * @return the value of velocidad
   */
  public String getVelocidad () {
    return velocidad;
  }

  /**
   * Set the value of cantidaddemotores
   * @param newVar the new value of cantidaddemotores
   */
  public void setCantidaddemotores (String newVar) {
    cantidaddemotores = newVar;
  }

  /**
   * Get the value of cantidaddemotores
   * @return the value of cantidaddemotores
   */
  public String getCantidaddemotores () {
    return cantidaddemotores;
  }

  //
  // Other methods
  //

  /**
   * @param        aerolinea1
   * @param        cantidaddemotores1
   * @param        velocidad1
   * @param        capacidad1
   */

  /**
   */
  public void acelerar()
  {
  System.out.println("El avion acelero");
  }


  /**
   */
  public void elevarse()
  {
  System.out.println("El avion se estrelló");
  }


  /**
   * @param        modelo1
   */
  

}
