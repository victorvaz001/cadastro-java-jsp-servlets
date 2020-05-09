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
<title>Sistema Web Java</title>


<link type="text/css" href="resourses/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css"
	href="resourses/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link type="text/css" href="resourses/css/theme.css"
	rel="stylesheet">
<link type="text/css"
	href="resourses/images/icons/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css"
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
	rel='stylesheet'>

</head>
<body>

	<!--  Tela de login de acesso para o Sistema -->
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="index.jsp"> Sistema Web Java </a>
			</div>
		</div>
	</div>


	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="module module-login span4 offset4">
					<form class="form-vertical" action="LoginServlet" method="post">
						<div class="module-head">
							<h2 style="text-align: center;">JSP + Servlet + JDBC</h2>
							<h3 style="text-align: center;">Dados para acesso:</h3>
							<center>
								<strong>Login:</strong> admin
							</center>
							<center>
								<strong>Senha:</strong> admin
							</center>
							<div class="alert-error" style="text-align: center;">
								<button type="button" class="close" data-dismiss="alert"></button>
								${msg}
							</div>

						</div>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text" id="login" name="login"
										placeholder="Digite o Login" required>
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="password" id="senha" name="senha"
										placeholder="Digite a Senha" required>
								</div>
							</div>
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
									<button type="submit" class="btn btn-primary">Logar</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--/.wrapper-->

	<div class="footer">
		<div class="container">


			<div class="container" style="text-align: center;">
				<b class="copyright">Sistema de cadastro com: JavaEE + JDBC +
					JSP + PostgreSQL </b>
			</div>
		</div>
	</div>



	<script src="resourses/scripts/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	<script
		src="resourses/scripts/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="resourses/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>