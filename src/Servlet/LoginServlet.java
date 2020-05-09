package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BeanCursoJsp;
import dao.DaoLogin;

@WebServlet("/LoginServlet") // mapeamento
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoLogin daoLogin = new DaoLogin();

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			BeanCursoJsp beanCursoJsp = new BeanCursoJsp();

			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			
			String url = request.getParameter("url");
			
			String msg = "";


			if (login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {

				if (daoLogin.validarLogin(login, senha)) {// acesso ok
					
					BeanCursoJsp userLogado = new BeanCursoJsp();
					userLogado.setLogin(login);
					userLogado.setSenha(senha);
					
					
					//Adciona o usuarioLogado na sessão
					HttpServletRequest req = (HttpServletRequest) request;
					HttpSession session = req.getSession();
					session.setAttribute("usuario", userLogado);
					
					
					//redireciona para o sistema
					RequestDispatcher dispatcher = request.getRequestDispatcher("/acessoliberado.jsp");
					dispatcher.forward(request, response);
					
					
				} else {// acesso negado
					request.setAttribute("msg", "Usuario ou senha invalidos!");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
					dispatcher.forward(request, response);
			   }

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
