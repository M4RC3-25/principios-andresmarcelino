public class Main {

    public static void main(String[] args) {

        Figura rectangulo = new Rectangulo(4, 5);
        Figura cuadrado = new Cuadrado(4);

        CalculadoraArea calculadora = new CalculadoraArea();

        calculadora.imprimirArea(rectangulo);
        calculadora.imprimirArea(cuadrado);
    }
}
