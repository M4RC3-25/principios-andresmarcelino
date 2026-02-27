public class Main {

    public static void main(String[] args) {

        Trabajable humano = new Humano();
        Trabajable robot = new Robot();

        humano.trabajar();
        robot.trabajar();

        Comible persona = new Humano();
        persona.comer();
    }
}
