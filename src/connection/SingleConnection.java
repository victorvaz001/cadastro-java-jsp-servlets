package connection;

import java.sql.Connection;
import java.sql.DriverManager;

/*Responsavel por fazer a conexao com o banco de dados*/

public class SingleConnection {

	//?autoReconnect=true -> caso a conexao caia, será retomada automaticamente
	private static String banco = "jdbc:postgresql://localhost:5432/victorgo_projetojspservlet?autoReconnect=true";
	private static String password = "-9fu8B7A8WIv)s";
	private static String user = "victorgo";
	private static Connection connection = null;
	
	static {
		conectar();
	}
	
	public SingleConnection() {
		conectar();
	}
	
	private static void conectar() {
		try {
			if(connection == null) {
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(banco, user, password);
				connection.setAutoCommit(false);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao conectar com o banco de dados");
		}
	}
	
	public static Connection getConnection() {
		return connection;
	}
	
	
}
