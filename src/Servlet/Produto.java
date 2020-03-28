package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanProduto;
import dao.DaoProduto;

@WebServlet("/salvarProduto")
public class Produto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DaoProduto daoProduto = new DaoProduto();

	public Produto() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
		String acao = request.getParameter("acao") != null ? request.getParameter("acao") : "listartodos";
		String produto = request.getParameter("produto");
		
		RequestDispatcher view = request.getRequestDispatcher("/CadastroProduto.jsp");

		if (acao != null && acao.equalsIgnoreCase("delete") && produto != null) {
			daoProduto.delete(produto);
			
			
			request.setAttribute("produtos", daoProduto.listar());

		} else if (acao != null && acao.equalsIgnoreCase("editar")) {

			BeanProduto beanProduto = daoProduto.consultar(produto);

			request.setAttribute("produto", beanProduto);

		} else if (acao != null && acao.equalsIgnoreCase("listartodos")) {

			request.setAttribute("produtos", daoProduto.listar());
		} 
		
		request.setAttribute("categorias", daoProduto.listaCategorias());
		view.forward(request, response); //confirma o redirecionamento
		
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {

			try {
				RequestDispatcher view = request.getRequestDispatcher("/CadastroProduto.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				request.setAttribute("categorias", daoProduto.listaCategorias());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {

			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String quantidade = request.getParameter("quantidade");
			String valor = request.getParameter("valor");
			String categoria = request.getParameter("categoria_id");

			try {

				String msg = null;
				boolean podeInserir = true;

				if (nome == null || nome.isEmpty()) {
					msg = "O nome deve ser informado";
					podeInserir = false;

				} else if (quantidade == null || quantidade.isEmpty()) {
					msg = "A quantidade deve ser informada";
					podeInserir = false;

				} else if (valor == null || valor.isEmpty()) {
					msg = "O valor deve ser informado";
					podeInserir = false;

				} else if (id == null || id.isEmpty() && !daoProduto.validarNome(nome)) { // quando for usuario novo
					msg = "Produto ja extiste com o memso nome!";
					podeInserir = false;
				}

				BeanProduto produto = new BeanProduto();
				produto.setNome(nome);
				produto.setId(!id.isEmpty() ? Long.parseLong(id) : null);
				produto.setCategoria_id(Long.parseLong(categoria));
				

				if (quantidade != null && !quantidade.isEmpty()) {
					produto.setQuantidade(Integer.parseInt(quantidade));// so pode converter caso tenho dados dentro

				}
				if (valor != null && !valor.isEmpty()) {
					String valorProduto = valor.replaceAll("\\.", "");// 10500,20, retira ponto por nada, retorno

					valorProduto = valorProduto.replaceAll("\\,", ".");// 10500.20 valor obtido pelo parse
					produto.setValor(Double.parseDouble((valorProduto)));// so pode converter caso tenho dados dentro
				}

				if (id == null || id.isEmpty() && daoProduto.validarNome(nome) && podeInserir) {
					daoProduto.salvar(produto);
					msg = "\nProdugo salvo com sucesso!";

				} else if (id != null && !id.isEmpty() && podeInserir) {

					if (!daoProduto.validarNomeUpdate(nome, id)) {
						msg = "\nNão e possivel atualizar, esté produto ja extiste com o mesmo nome!";
						podeInserir = false;
					} else {
						daoProduto.atualizar(produto);
						request.setAttribute("msg", "Produto atualizado com sucesso!");
					}
				}

				if (!podeInserir) {
					request.setAttribute("produto", produto);// tera os dados que veio da tela, volta com todos os
																// atributos
				}

				if (msg != null) {
					request.setAttribute("msg", msg);

				}

				RequestDispatcher view = request.getRequestDispatcher("/CadastroProduto.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				request.setAttribute("categorias", daoProduto.listaCategorias());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
