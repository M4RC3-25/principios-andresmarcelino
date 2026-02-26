

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
   * @param        _args
   */
  public static void main(String[] args)
  {
  CuentaBancaria cuenta1 = new CuentaBancaria(1000.0);
  
  System.out.println("Saldo actual = " + cuenta1.getSaldo());
  cuenta1.depositar(500.0);
  cuenta1.retirar(1500.0);

  System.out.println("Saldo actual = " + cuenta1.getSaldo());
  cuenta1.retirar(100.0);

  }


}
