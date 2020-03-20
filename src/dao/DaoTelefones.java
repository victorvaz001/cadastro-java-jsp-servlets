package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Telefones;
import connection.SingleConnection;

public class DaoTelefones {

	private Connection connection;

	public DaoTelefones() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(Telefones telefone) {

		try {

			String sql = "insert into telefones (numero, tipo, usuario) values (?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, telefone.getNumero());
			insert.setString(2, telefone.getTipo());
			insert.setLong(3, telefone.getUsuario());
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	public List<Telefones> listar(Long user) {
		List<Telefones> listar = new ArrayList<Telefones>();

		try {

			String sql = "select * from telefones where usuario = "+ user;
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultado = preparedStatement.executeQuery();

			while (resultado.next()) {
				Telefones telefone = new Telefones();

				telefone.setId(resultado.getLong("id"));
				telefone.setNumero(resultado.getString("numero"));
				telefone.setTipo(resultado.getString("tipo"));
				telefone.setUsuario(resultado.getLong("usuario"));

				listar.add(telefone);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listar;

	}

	public void delete(String id) {

		try {

			String sql = "delete from telefones where id = '" + id + "'";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();

			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
}
