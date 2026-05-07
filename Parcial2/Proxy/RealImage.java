class RealImage implements Image {

	private String filename;

	public RealImage(String filename){
		this.filename = filename;
		loadFromDisk();
	}

	public void loadFromDisk(){
		System.out.println("Cargando imagen desde el disco: " + filename);
	}

	@Override
	public void display(){
		System.out.println("Mostrando imagen: " + filename);
	}
}
