package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import beans.BeanCursoJsp;

//n�o precisa declar no web.xml
@WebFilter(urlPatterns = {"/acessoliberado.jsp"})
public class FilterAutenticacao implements Filter {

	
	//intercepta todas as requisi��es
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		
		//retorna nulo caso n�o esteja logado
		BeanCursoJsp userLogado = (BeanCursoJsp)session.getAttribute("usuario");
		
		if(userLogado == null) {//usu�rio n�o logado
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			return;//para o processo para redirecionar
		}
		
		//executa as a��es do request e response
		chain.doFilter(request, response);
		
	}
	
	//executa alguma coisa quando uma aplica��o e iniciada
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
