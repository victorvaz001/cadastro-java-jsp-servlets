package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCursoJsp;
import beans.Telefones;
import dao.DaoTelefones;
import dao.DaoUsuario;

@WebServlet("/salvarTelefones")
public class TelefonesServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	private DaoTelefones daoTelefones = new DaoTelefones();

	public TelefonesServlets() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String acao = request.getParameter("acao");
			String user = request.getParameter("user");
			
			if(user != null) {
			BeanCursoJsp usuario = daoUsuario.consultar(user);

			if (acao.equalsIgnoreCase("addFone")) {

				request.getSession().setAttribute("userEscolhido", usuario);
				request.setAttribute("userEscolhido", usuario);

				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");// redirecionamento
				request.setAttribute("telefones", daoTelefones.listar(usuario.getId()));
				view.forward(request, response);

			} else if (acao.equalsIgnoreCase("deleteFone")) {
				String foneId = request.getParameter("foneId");
				daoTelefones.delete(foneId); // deleta o usuario

				// pega o usuario que está em edição
				BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");

				// carrega todos, menos oque foi deletado
				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");// redirecionamento
				request.setAttribute("userEscolhido", usuario);
				request.setAttribute("telefones", daoTelefones.listar(Long.parseLong(user)));
				request.setAttribute("msg", "Removido com sucesso");
				view.forward(request, response);

			}
			
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
			request.setAttribute("usuarios", daoUsuario.listar());
			view.forward(request, response);
			
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");
			// Quando for clicado em salvar, sera recuperado o objeto que o usuario // DADOS
			// no

			String numero = request.getParameter("numero"); // pega o numero de telefone
			String tipo = request.getParameter("tipo");// pega o tipo de telefone

			String acao = request.getParameter("acao");

			if (acao == null || (acao != null && !acao.equalsIgnoreCase("voltar"))) {

				if (numero == null || (numero != null && numero.isEmpty())) {

					RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");// redirecionamento
					request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
					request.setAttribute("msg", "Informe o numero do telefone");
					view.forward(request, response);
				} else {

					Telefones telefones = new Telefones();
					telefones.setNumero(numero); // seta no objeto telefones os dados de telefone
					telefones.setTipo(tipo);
					telefones.setUsuario(beanCursoJsp.getId());

					daoTelefones.salvar(telefones); // salva os dados

					request.getSession().setAttribute("userEscolhido", beanCursoJsp); // coloca o usuario que está sendo
																						// cadastrado na sessão
					request.setAttribute("userEscolhido", beanCursoJsp);// joga em atributo de request

					RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");// redirecionamento para
																							// tela de
																							// telefones
					request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));// passa a lista de
																									// telefones
																									// para carregar na
																									// tela
					request.setAttribute("msg", "Salvo com sucesso");
					view.forward(request, response);

				}

			}else {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);// redirecionamento para o navagador, notifica o navegador
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
