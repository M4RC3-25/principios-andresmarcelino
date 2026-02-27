public class Main {

    public static void main(String[] args) {

        Dispositivo bombilla = new Bombilla();
        Interruptor interruptor1 = new Interruptor(bombilla);
        interruptor1.presionar();

        Dispositivo led = new LamparaLED();
        Interruptor interruptor2 = new Interruptor(led);
        interruptor2.presionar();
    }
}
