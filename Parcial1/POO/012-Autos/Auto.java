
import java.util.*;
public class Auto {
  private String marca;
  public Auto (String marca) {
    this.marca = marca;
  };
  
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

}
