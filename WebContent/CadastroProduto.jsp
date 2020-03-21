<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!--  biblioteca do JSP -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--format Number   -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="resourses/css/cadastro.css">

<script src="resourses/javascript/jquery.min.js" type="text/javascript"></script>
<script src="resourses/javascript/jquery.maskMoney.min.js" type="text/javascript"></script>


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
						<td><input style="width: 400px" type="text" id="nome" name="nome"
							value="${produto.nome}" maxlength="100" placeholder="Informe o nome do Produto" title="Informe o nome do Produto"/></td>
					</tr>
					<tr>
						<td>Quantidade Un:</td>
						<td><input type="number" id="quantidade" name="quantidade"
							value="${produto.quantidade}" maxlength="10" placeholder="Informe a quantidade" title="Informe a quantidade"/></td>
					</tr>
					<tr>
					
					<!-- ValorEmTexto em valorEmTexto transforma o valor em um atributo -->
						<td>Valor R$:</td>
						<td><input type="text" id="valor" name="valor" data-thousands="." data-decimal="," data-precision="2"
							value="${produto.valorEmTexto}" maxlength="20" placeholder="Informe o valor do produto" title="Informe o valor do produto"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" style="width: 86px"/> <input
							style="width: 89px" type="submit" value="Cancelar"
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
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${produto.valor}"/> </td>

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
		
	<script type="text/javascript">
	
	$(function() {
  		 $('#valor').maskMoney(); //mascara de dinheiro
 	})
	
	
	</script>


</body>
</html>