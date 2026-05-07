public class ConcreteFlyweight implements Flyweight{
	private String fuente;
	private int tamaño;
	private String color;

	public ConcreteFlyweight(String fuente, int tamaño, String color){
		this.fuente = fuente;
		this.tamaño = tamaño;
		this.color = color;
	}

	@Override
	public  void operacion(String contexto){
		System.out.println("caracter: " + contexto + " | Fuente: " + fuente + " | Tamaño: " + tamaño + " pt | Color: " + color);
	}

	public String getFuente(){ return fuente; }

	public int getTamaño(){ return tamaño; }

	public String getColor(){ return color; }
}

