public class PagoPayPal implements MetodoPago {

    @Override
    public void procesarPago() {
        System.out.println("Procesando pago con PayPal...");
    }
}
