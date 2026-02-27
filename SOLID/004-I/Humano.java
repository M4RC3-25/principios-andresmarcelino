public class Humano implements Trabajable, Comible {

    @Override
    public void trabajar() {
        System.out.println("Trabajando...");
    }

    @Override
    public void comer() {
        System.out.println("Comiendo...");
    }
}
