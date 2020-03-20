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

		String acao = request.getParameter("acao");
		String produto = request.getParameter("produto");

		if (acao.equalsIgnoreCase("delete")) {
			daoProduto.delete(produto);
			RequestDispatcher view = request.getRequestDispatcher("/CadastroProduto.jsp");
			request.setAttribute("produtos", daoProduto.listar());
			view.forward(request, response);

		} else if (acao.equalsIgnoreCase("editar")) {

			BeanProduto beanProduto = daoProduto.consultar(produto);
			RequestDispatcher view = request.getRequestDispatcher("/CadastroProduto.jsp");
			request.setAttribute("produto", beanProduto);
			view.forward(request, response);

		} else if (acao.equalsIgnoreCase("listartodos")) {

			RequestDispatcher view = request.getRequestDispatcher("/CadastroProduto.jsp");
			request.setAttribute("produtos", daoProduto.listar());
			view.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {
			RequestDispatcher view = request.getRequestDispatcher("/CadastroProduto.jsp");
			request.setAttribute("produtos", daoProduto.listar());
			view.forward(request, response);
		}

		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String quantidade = request.getParameter("quantidade");
		String valor = request.getParameter("valor");

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

			try {
				if (quantidade != null && !quantidade.isEmpty()) {
					produto.setQuantidade(Integer.parseInt(quantidade));// so pode converter caso tenho dados dentro

				}
				if (valor != null && !valor.isEmpty()) {
					produto.setValor(Double.parseDouble(valor));// so pode converter caso tenho dados dentro
				}

			} catch (NumberFormatException e) {
				msg = "Digite somente n�meros na (quantidade) e no (valor)";
				podeInserir = false;
			}

			if (msg != null) {
				request.setAttribute("msg", msg);

			} else if (id == null || id.isEmpty() && daoProduto.validarNome(nome) && podeInserir) {
				daoProduto.salvar(produto);
				msg = "\nProdugo salvo com sucesso!";

			} else if (id != null && !id.isEmpty() && podeInserir) {

				if (!daoProduto.validarNomeUpdate(nome, id)) {
					msg = "\nN�o e possivel atualizar, est� produto ja extiste com o mesmo nome!";
					// podeInserir = false;
				} else {
					daoProduto.atualizar(produto);
					request.setAttribute("msg", "Produto atualizado com sucesso!");
				}
			}

			if (!podeInserir) {
				request.setAttribute("produto", produto);// tera os dados que veio da tela, volta com todos os
															// atributos
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher view = request.getRequestDispatcher("/CadastroProduto.jsp");
		request.setAttribute("produtos", daoProduto.listar());
		view.forward(request, response);

	}

}
