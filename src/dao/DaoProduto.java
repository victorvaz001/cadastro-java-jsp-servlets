package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanProduto;
import connection.SingleConnection;

public class DaoProduto {

	private Connection connection;

	public DaoProduto() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(BeanProduto produto) {

		try {

			String sql = "insert into produto (nome, quantidade, valor) values (?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, produto.getNome());
			insert.setInt(2, produto.getQuantidade());
			insert.setDouble(3, produto.getValor());
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

	public List<BeanProduto> listar() {
		List<BeanProduto> list = new ArrayList<BeanProduto>();

		try {

			String sql = "select * from produto";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultado = preparedStatement.executeQuery();

			while (resultado.next()) {
				BeanProduto beanProduto = new BeanProduto();

				beanProduto.setId(resultado.getLong("id"));
				beanProduto.setNome(resultado.getString("nome"));
				beanProduto.setQuantidade(resultado.getInt("quantidade"));
				beanProduto.setValor(resultado.getDouble("valor"));

				list.add(beanProduto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public void delete(String id) {

		try {

			String sql = "delete from produto where id = '" + id + "'";
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

	public BeanProduto consultar(String id)  {
		
		try {
		String sql = "select * from produto where id= '" + id + "'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			BeanProduto beanProduto = new BeanProduto();
			beanProduto.setId(resultSet.getLong("id"));
			beanProduto.setNome(resultSet.getString("nome"));
			beanProduto.setQuantidade(resultSet.getInt("quantidade"));
			beanProduto.setValor(resultSet.getDouble("valor"));

			return beanProduto;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void atualizar(BeanProduto produto) {

		try {

			String sql = "update produto set nome = ?, quantidade = ?, valor = ? where id = " + produto.getId();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, produto.getNome());
			preparedStatement.setInt(2, produto.getQuantidade());
			preparedStatement.setDouble(3, produto.getValor());

			preparedStatement.executeUpdate(); // numeros de linhas que foi afetada, por linha
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

	public boolean validarNome(String nome) {

		try {
			String sql = "select count(1) as qtd from produto where nome = '" + nome + "'";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {

				return resultSet.getInt("qtd") <= 0; // retorna true, ja contem um produto com o nome passado por parametro
			}

		} catch (Exception e) {
			e.printStackTrace();

			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean validarNomeUpdate(String nome, String id) {
		
		try {
			
			String sql = "select count(1) as qtd from produto where nome = '" + nome + "' and id <> " + id;
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				
				return resultSet.getInt("qtd") <=0; //retorna true
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		
		return false;
	}

}
