<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
type="beans.BeanCursoJsp" scope="page" />
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagina de cabecalho</title>
</head>
<body>
	<jsp:setProperty property="*" name="calcula" />
	
	<h3>Seja bem vindo ao sistema em JSP</h3>
	
	<a href="salvarUsuario?acao=listartodos"><img alt="cadastro-usuarios" title="Cadastro de Usuários" 
	src="resourses/img/cadastro-usuarios.png"  width="80px" height="80px"></a>
	
	<a href="salvarProduto?acao=listartodos"><img alt="cadastro-produtos" title="Cadastro de Produtos"
	 src=resourses/img/produto.png width="80px" height="80px"> </a>
	
</body>
</html>