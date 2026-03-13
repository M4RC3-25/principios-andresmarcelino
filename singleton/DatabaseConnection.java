import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Instancia única del Singleton
    private static DatabaseConnection instance;

    // Objeto conexión
    private Connection connection;

    // Datos de conexión
    private static final String URL = "jdbc:mariadb://localhost:3306/mi_base";
    private static final String USER = "m4rc3";
    private static final String PASSWORD = "m4rc3";

    // Constructor privado
    private DatabaseConnection() {
        try {
            // Cargar el driver de MariaDB
            Class.forName("org.mariadb.jdbc.Driver");

            // Crear la conexión
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión establecida.");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver de MariaDB no encontrado", e);
        } catch (SQLException e) {
            throw new RuntimeException("Error al conectar a la base de datos", e);
        }
    }

    // Método de acceso global
    public static DatabaseConnection getInstance() {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    // Método para obtener la conexión
    public Connection getConnection() {
        return connection;
    }
}
