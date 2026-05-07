import java.sql.Connection;
import java.sql.DriverManager;

public class TestConexion {

    public static void main(String[] args) {

        String url = "jdbc:mariadb://localhost:3306/mi_base";
        String user = "andriuwu";
        String password = "andriuwu";

        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Conexion exitosa a la base de datos");
            conn.close();
        } catch (Exception e) {
            System.out.println("Error en la conexion");
            e.printStackTrace();
        }
    }
}
