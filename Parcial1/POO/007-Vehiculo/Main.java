

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
   */
  public static void main(String[] args)
  {
  //Automovil
  Automovil auto1 = new Automovil("volvo 550", 120, 4, 5, 4);
  auto1.mostrarDatos();
  auto1.pruebaDelMotor();
  System.out.println("");
  // Moto
  Motocicleta moto1 = new Motocicleta("Italika",120,2,2);
  moto1.mostrarDatos();
  moto1.pruebaDelMotor();
  System.out.println("");
  // Autobus
  Autobus bus1 = new Autobus("Mercedez",300,8,42,2,2);
  bus1.mostrarDatos();
  bus1.pruebaDelMotor();
  System.out.println("");

  Autobus bus2 = new Autobus("Mercedez smart",250,6,25,1,1);
  bus2.mostrarDatos();
  bus2.pruebaDelMotor();
  
  }


}
