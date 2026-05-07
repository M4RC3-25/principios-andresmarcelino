

/**
 * Class CuentaBancaria
 */
public class CuentaBancaria {

  //
  // Fields
  //

  private double saldo;
  
  //
  // Constructors
  //
  public CuentaBancaria (double saldo) {
  this.saldo = saldo;
  
  };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of saldo
   * @param newVar the new value of saldo
   */
  public void setSaldo (double newVar) {
    saldo = newVar;
  }

  /**
   * Get the value of saldo
   * @return the value of saldo
   */
  public double getSaldo () {
    return saldo;
  }

  //
  // Other methods
  //

  /**
   * @param        saldo
   */


  /**
   * @return       double
   */


  /**
   * @param        saldo
   */
  public void depositar(double cantidad)
  {
  System.out.println("Deposito = " + cantidad);
        saldo += cantidad;
  }


  /**
   * @param        saldo
   */
  public void retirar(double cantidad)
  {
  
  System.out.println("Retirando " + cantidad);

        if (cantidad <= saldo) {
            saldo -= cantidad;
            System.out.println("Retiro = " + cantidad);
        } else {
            System.out.println("Fondos insuficientes...");
        }
  
  }


}
