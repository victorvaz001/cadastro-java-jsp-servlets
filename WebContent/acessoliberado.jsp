<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
type="beans.BeanCursoJsp" scope="page" />
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagina de cabecalho</title>
</head>
<body>

<a href="acessoliberado.jsp"><img title="Inicio" src="resourses/img/home.png" width="40px" height="40px"/></a>
<a href="index.jsp"><img title="Sair" src="resourses/img/sair.png" width="40px" height="40px"/></a>
	
	<div style="text-align: center; padding-top: 20%">
	<h1>Bem vindo ao sistema!</h1>
	
	<center>
	<table>
	<tr>
		<td><a href="salvarUsuario?acao=listartodos"><img alt="cadastro-usuarios" title="Cadastro de Usuários" 
	src="resourses/img/addusers.png"  width="90px" height="90px"></a> </td>
		<td><a href="salvarProduto?acao=listartodos" ><img alt="cadastro-produtos" title="Cadastro de Produtos"
	 src=resourses/img/adproduto.png width="100px" height="100px"> </a> </td>
	</tr>
	<tr>
		<td>Cad. Usuário </td>
		<td>Cad. Produto</td>
	</tr>
	
	</table>

	 </div>
	 </center>
	
</body>
</html>