<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page" />
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="acessoliberado.jsp">Bem vindo ao sistema
				</a>
				<div class="nav-collapse collapse navbar-inverse-collapse">

					<ul class="nav pull-right">

						<li class="nav-user dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="resourses/img/user.png" class="nav-avatar" /> <b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="salvarUsuario?acao=listartodos">Usuarios</a></li>
								<li><a href="salvarProduto?acao=listartodos">Produtos</a></li>
								<li><a href="acessoliberado.jsp">Inicio</a></li>
								<li class="divider"></li>
								<li><a href="index.jsp">Sair</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.nav-collapse -->
			</div>
		</div>
		<!-- /navbar-inner -->
	</div>

	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">
						<ul class="widget widget-menu unstyled">
							<li class="active"><a href="acessoliberado.jsp"><i
									class="icon-home"></i>Inicio </a></li>
							<li><a href="index.jsp"><i class="icon-signout"></i>Sair
							</a></li>
						</ul>

					</div>

				</div>
				<!--/.span3-->
				<div class="span9">
					<div class="content">
						<div class="btn-controls">
							<div class="btn-box-row row-fluid">
								<a href="salvarUsuario?acao=listartodos"
									class="btn-box big span4"><i class=" icon-group"></i><b>Cadastro
										de usuários</b> </a><a href="salvarProduto?acao=listartodos"
									class="btn-box big span4"><i class="icon-shopping-cart"></i><b>Cadastro
										de Produtos</b></a>

							</div>

						</div>

						<!--/.module-->
					</div>
					<!--/.content-->
				</div>
				<!--/.span9-->
			</div>
		</div>
		<!--/.container-->
	</div>
	<div class="footer">
		<div class="container" style="text-align: center;">
			<b class="copyright">Sistema de cadastro com: JavaEE + JDBC + JSP
				+ PostgreSQL </b>
		</div>
	</div>

	<script src="resourses/scripts/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	<script
		src="resourses/scripts/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="resourses/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>

	<script src="resourses/scripts/flot/jquery.flot.js"
		type="text/javascript"></script>
	<script src="resourses/scripts/flot/jquery.flot.resize.js"
		type="text/javascript"></script>
	<script
		src="resourses/scripts/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script src="resourses/scripts/common.js"
		type="text/javascript"></script>

</body>
</html>