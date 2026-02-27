public class UsuarioRepository {

    public void guardar(Usuario usuario) {
        System.out.println("Guardando usuario en BD...");
        System.out.println("Nombre: " + usuario.getNombre());
        System.out.println("Email: " + usuario.getEmail());
    }
}
