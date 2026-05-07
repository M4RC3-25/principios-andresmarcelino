public class PagoTransferencia implements MetodoPago {

    @Override
    public void procesarPago() {
        System.out.println("Procesando transferencia bancaria...");
    }
}
