<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!--Tag jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Telefones</title>
<link rel="stylesheet" href="resourses/css/cadastro.css">



</head>
<body>
	<a href="acessoliberado.jsp"><img title="Inicio" src="resourses/img/home.png" width="40px" height="40px"/></a>
	<a href="index.jsp"><img title="Sair" src="resourses/img/sair.png" width="40px" height="40px"/></a>
	<h1 style="text-align: center;">Cadastro de Telefones</h1>
	<h3 style="text-align: center; color: orange;">${msg}</h3>

	<form action="salvarTelefones" method="post" id="formUser"
		onsubmit="return validarCampos()? true : false">
		<!-- Executa antes de inviar para o servidor -->
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Usuário:</td>
						<td><input type="text" id="user" readonly="readonly"
							name="user" class="field-long" value="${userEscolhido.id}"></td>

						<td><input type="text" id="nome" name="nome"
							class="field-long" value="${userEscolhido.nome}"
							readonly="readonly"/></td>
					</tr>
					<tr>
						<td>Número:</td>
						<td><input type="text" id="numero" name="numero"></td>
						<td>
						<select id="tipo" name="tipo" style="width: 180px;">
								<option>Casa</option>
								<option>Contato</option>
								<option>Celular</option>
								<option>Outros</option>
						</select>
						</td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" style="width: 180px"/> 
						</td>
						<td>
						<input type="submit" value="Voltar" onclick="document.getElementById('formUser').action = 'salvarTelefones?acao=voltar'" style="width: 180px"/>
						</td>
					</tr>
				</table>
			</li>
		</ul>
	</form>


	<div class="container">
		<table class="responsive-table">
			<caption>Lista de telefones</caption>
			<tr>
				<th>Id</th>
				<th>Número</th>
				<th>Tipo</th>
				<th>Excluir</th>
			</tr>
			<c:forEach items="${telefones}" var="fone">
				<tr>
					<td><c:out value="${fone.id}"></c:out></td>
					<td><c:out value="${fone.numero}"></c:out></td>
					<td><c:out value="${fone.tipo}"></c:out></td>
					<td><a onclick="return confirm('Confirmar exclusão?');"
						href="salvarTelefones?user=${fone.usuario}&acao=deleteFone&foneId=${fone.id}">
							<img src="resourses/img/excluir.png" alt="Excluir"
							title="Excluir" width="20px" height="20px">
					</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script type="text/javascript">
		function validarCampos() {

			if (document.getElementById("numero").value == '') {
				//document.getElementById("numero").focus();
				//alert('Informe o Número');
				//return false;
			} else if (document.getElementById("tipo").value == '') {
				document.getElementById("tipo").focus();
				alert('Informe o Tipo');
				return false;
			}
			return true; //se todas os dados estiverem sidos informados corretamente, retornara true e deixara cadastrar!
		}
	</script>
</body>
</html>