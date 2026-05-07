public class Main {

    public static void main(String[] args) {

        Usuario usuario = new Usuario("Andres", "andres@email.com");

        UsuarioRepository repository = new UsuarioRepository();
        repository.guardar(usuario);

        EmailService emailService = new EmailService();
        emailService.enviarBienvenida(usuario);
    }
}
