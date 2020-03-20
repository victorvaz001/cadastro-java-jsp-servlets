<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="resourses/css/cadastro.css">

<meta charset="ISO-8859-1">
<title>Cadastro de produtos</title>
</head>
<body>

<a href="acessoliberado.jsp">Inicio</a>
<a href="index.jsp">Sair</a>
	<h1 style="text-align: center;">Cadastro de Produtos</h1>
	<h3 style="text-align: center; color: green;">${msg}</h3>
	<form action="salvarProduto" method="post" id="formProduduct"
		onsubmit="return validarCamposProdutos()? true: false">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Codigo:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${produto.id}" /></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${produto.nome}" placeholder="Informe o nome do Produto" title="Informe o nome do Produto"/></td>
					</tr>
					<tr>
						<td>Quantidade:</td>
						<td><input type="text" id="quantidade" name="quantidade"
							value="${produto.quantidade}" placeholder="Informe a quantidade" title="Informe a quantidade"/></td>
					</tr>
					<tr>
						<td>Valor R$:</td>
						<td><input type="text" id="valor" name="valor"
							value="${produto.valor}" placeholder="Informe o valor do produto" title="Informe o valor do produto"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" /> <input
							type="submit" value="Cancelar"
							onclick="getElementById('formProduduct').action = 'salvarProduto?acao=reset'" /></td>
					</tr>
				</table>
			</li>
		</ul>
	</form>
	<div class="container">
		<table class="responsive-table">

			<tr>
				<th>Id:</th>
				<th>Nome:</th>
				<th>Quantidade:</th>
				<th>Valor:</th>
				<th>Excluir:</th>
				<th>Editar:</th>
			</tr>

			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td><c:out value="${produto.id}"></c:out></td>
					<td><c:out value="${produto.nome}"></c:out></td>
					<td><c:out value="${produto.quantidade}"></c:out></td>
					<td><c:out value="${produto.valor}"></c:out></td>

					<td><a href="salvarProduto?acao=delete&produto=${produto.id}"><img
							src="resourses/img/excluir.png" alt="excluir" title="Excluir"
							width="20px" height="20px"> </a></td>

					<td><a href="salvarProduto?acao=editar&produto=${produto.id}"><img
							src="resourses/img/editar.png" width="20px" height="20px"
							title="editar"> </a></td>
				</tr>

			</c:forEach>

		</table>
	</div>

	<script type="text/javascript">
		function validarCamposProdutos(){
			if(document.getElementById("nome").value == ''){
				document.getElementById("nome").focus();
				alert("Informe o nome");
				return false;
			}
			else if (document.getElementById("quantidade").value == ''){
				document.getElementById("quantidade").focus();
				alert("Informe a quantidade");
				return false;
			}
			else if(document.getElementById("valor").value == ''){
				document.getElementById("valor").focus();
				alert("Informe o valor");
				return false;
			}
			return true;
		}
		
	function getFocus(){
		document.get
	}
	
	
	</script>




</body>
</html>