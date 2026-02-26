import java.util.List;
import java.util.ArrayList;

/**
 * Class Main
 */
public class Main {

  //
  // Fields
  //

  
  //
  // Constructors
  //
  public Main () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  //
  // Other methods
  //

  /**
   * @param        args
   */
  public static void main(String[] args)
  {
  Profesor p1 = new Profesor("Adsoftsito", "Principios");
  Profesor p2 = new Profesor("Gabriel", "IA");

  List<Profesor>profesores = new ArrayList<>();
  profesores.add(p1);
  profesores.add(p2);

  Universidad unv = new Universidad("USBI", profesores);
  unv.mostrarProfesores();
  }


}
