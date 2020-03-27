<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page"></jsp:useBean>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="resourses/css/estilo.css">

</head>
<body>

	<!--  Tela de login de acesso para o Sistema -->
	<div class="login-page">
	<h3 style="text-align: center">Sistema de cadsatro</h3><br>
	<h1 style="text-align: center">JSP + Servlet + JDBC </h1>
	<center><span><b>USUÁRIO:</b> admin <br> <b>SENHA:</b> admin</span></center><br>
		<div class="form">
			<form action="LoginServlet"  class="login-form">
				Login: <input type="text" id="login" name="login"> <br />
				Senha: <input type="password" id="senha" name="senha"> <br />
				<button type="submit" value="Logar">Logar</button>
			</form>
		</div>
		<h3 style="text-align: center"><a href="#" style="text-decoration: none;">Java Web </a></h3>
	</div>
</body>
</html>