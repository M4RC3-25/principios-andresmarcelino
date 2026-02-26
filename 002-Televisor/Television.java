

/**
 * Class Television
 */
public class Television {

  //
  // Fields
  //

  public String forma;
  public String calidaddevideo;
  protected String marca;
  private String tamaño;
  private String television;
  
  //
  // Constructors
  //
  public Television (String television) {
  this.television = television;
  System.out.println(television);
  };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of forma
   * @param newVar the new value of forma
   */
  public void setForma (String newVar) {
    forma = newVar;
  }

  /**
   * Get the value of forma
   * @return the value of forma
   */
  public String getForma () {
    return forma;
  }

  /**
   * Set the value of calidaddevideo
   * @param newVar the new value of calidaddevideo
   */
  public void setCalidaddevideo (String newVar) {
    calidaddevideo = newVar;
  }

  /**
   * Get the value of calidaddevideo
   * @return the value of calidaddevideo
   */
  public String getCalidaddevideo () {
    return calidaddevideo;
  }

  /**
   * Set the value of marca
   * @param newVar the new value of marca
   */
  public void setMarca (String newVar) {
    marca = newVar;
  }

  /**
   * Get the value of marca
   * @return the value of marca
   */
  public String getMarca () {
    return marca;
  }

  /**
   * Set the value of tamaño
   * @param newVar the new value of tamaño
   */
  public void setTamaño(String newVar) {
    this.tamaño = newVar;
  }

  /**
   * Get the value of tamaño
   * @return the value of tamaño
   */
  public String getTamaño () {
    return tamaño;
  }

  //
  // Other methods
  //

  /**
   * @return       Television
   * @param        forma1
   * @param        tamaño1
   * @param        calidaddevideo1
   * @param        marca
   */



  /**
   */
  public void apagada()
  {
  System.out.println("Television apagada");
  }


  /**
   */
  public void prendida()
  {
  System.out.println("Television encendida");
  }


  /**
   * @param        formal
   */
  


}
