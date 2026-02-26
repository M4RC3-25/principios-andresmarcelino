import java.util.List;
import java.util.ArrayList;
import java.util.*;


/**
 * Class Universidad
 */
public class Universidad {

  //
  // Fields
  //

  private String nombre;
  private List<Profesor> profesores;
  
  //
  // Constructors
  //
    public Universidad(String nombre, List<Profesor>profesores)
  {
  this.nombre = nombre;
  this.profesores = profesores;
  }
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of nombre
   * @param newVar the new value of nombre
   */
  public void setNombre (String newVar) {
    nombre = newVar;
  }

  /**
   * Get the value of nombre
   * @return the value of nombre
   */
  public String getNombre () {
    return nombre;
  }

  /**
   * Set the value of Profesores
   * @param newVar the new value of Profesores
   */
  public void setProfesores (List<Profesor> newVar) {
    profesores = newVar;
  }

  /**
   * Get the value of Profesores
   * @return the value of Profesores
   */
  public List<Profesor> getProfesores () {
    return profesores;
  }

  //
  // Other methods
  //

  /**
   * @param        nombre
   * @param        profesores
   */


  /**
   */
  public void mostrarProfesores()
  {
  System.out.println("Profesores en " + nombre + ":");
        for (Profesor p : profesores) {
              System.out.println("- " + p.getNombre() + " (" + p.getEspecialidad() + ")");
        }
  }


}
