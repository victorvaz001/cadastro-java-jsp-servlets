<%@page import="beans.BeanCursoJsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!--Tag jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Usuário</title>
<link rel="stylesheet" href="resourses/css/cadastro.css">

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

</head>
<body>

	<a href="acessoliberado.jsp"><img title="Inicio"
		src="resourses/img/home.png" width="40px" height="40px" /></a>
	<a href="index.jsp"><img title="Sair" src="resourses/img/sair.png"
		width="40px" height="40px" /></a>

	<h1 style="text-align: center;">Cadastro de usuario</h1>
	<h3 style="text-align: center; color: orange;">${msg}</h3>
	<form action="salvarUsuario" method="post" id="formUser"
		onsubmit="return validarCampos()? true : false;"
		enctype="multipart/form-data">
		<!-- Executa antes de inviar para o servidor -->
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Codigo:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}" class="field-long"></td>

						<td>Cep:</td>
						<td><input type="text" id="cep" name="cep"
							onblur="consultaCep();" value="${user.cep}"
							placeholder="Informe o cep" maxlength="9"></td>
					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}" placeholder="informe o login"
							maxlength="10"></td>

						<td>Rua:</td>
						<td><input type="text" id="rua" name="rua"
							value="${user.rua}" placeholder="Informe o nome da rua"
							maxlength="50"></td>
					</tr>

					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}" placeholder="Informe a senha"
							maxlength="10"></td>

						<td>Bairro:</td>
						<td><input type="text" id="bairro" name="bairro"
							value="${user.bairro}" placeholder="Informe o nome do bairro"
							maxlength="50"></td>

					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${user.nome}" placeholder="Informe o nome do usuário"
							maxlength="50"></td>

						<td>Cidade:</td>
						<td><input type="text" id="cidade" name="cidade"
							value="${user.cidade}" placeholder="Informe o nome da cidade"
							maxlength="50"></td>

					</tr>
					<tr>
						<td>IBGE:</td>
						<td><input type="text" id="ibge" name="ibge"
							value="${user.ibge}" placeholder="Informe o IBGE" maxlength="20"></td>

						<td>Estado:</td>
						<td><input type="text" id="estado" name="estado"
							value="${user.estado}" placeholder="Informe o nome do estado"
							maxlength="50"></td>

					</tr>
					<tr>
						<td>Foto:</td>
						<td><input type="file" name="foto"></td>

						<td>Sexo</td>
						<td><input type="radio" name="sexo" ${user.sexo eq 'masculino' ?'checked' : '' } 
						 value="masculino">Masculino</input> 
							
						<input type="radio" name="sexo" ${user.sexo eq 'feminino' ? 'checked' : ''} 
						 value="feminino">Feminino</input>
						 </td>
					</tr>

					<tr>
						<td>Curriculo:</td>
						<td><input type="file" name="curriculo" value="curriculo">
						</td>

						<td>Ativo:</td>
						<td><input type="checkbox" id="ativo" name="ativo"
							<% 
							if(request.getAttribute("user") != null){
								
								BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
								if(user.isAtivo()){
									out.print(" ");
									out.print("checked=\"checked\"");// será marcado caso o usuário for ativo
									out.print(" ");
								}
							}
						%>>
						</td>

					</tr>



					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" style="width: 173px">
						</td>
						<td></td>
						<td><input type="submit" style="width: 173px"
							value="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'" /></td>
					</tr>
				</table>
			</li>
		</ul>
	</form>


	<div class="container">
		<table class="responsive-table">
			<caption>Lista de usuários</caption>
			<tr>
				<th>Id</th>
				<th>Foto</th>
				<th>Curriculo</th>
				<th>Nome</th>
				<th>Telefones</th>
				<th>Delete</th>
				<th>Editar</th>
			</tr>
			<c:forEach items="${usuarios}" var="user">
				<tr>
					<td style="width: 150px"><c:out value="${user.id}"></c:out></td>

					<c:if test="${user.fotoBase64Miniatura.isEmpty() == false}">
						<td><a
							href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}"><img
								src='<c:out value="${user.fotoBase64Miniatura}"/>'
								alt="Imagem User" title="Imagem User" width="30px" height="30px"></a></td>
					</c:if>
					<c:if test="${user.fotoBase64Miniatura == null}">
						<td><img alt="Imagem User" src="resourses/img/userPadrao.png"
							width="40px" height="40px" onclick="alert('Não possui imagem!')">
						</td>
					</c:if>

					<c:if test="${user.curriculoBase64.isEmpty() == false}">
						<td><a
							href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id}"><img
								alt="Curriculo" src="resourses/img/pdf.png" width="30px"
								height="30px"></a></td>
					</c:if>
					<c:if test="${user.curriculoBase64 == null}">
						<td><img alt="Curriculo" src="resourses/img/pdf.png"
							width="30px" height="30px"
							onclick="alert('Não possui curriculo!')"></td>
					</c:if>

					<td style="width: 150px"><c:out value="${user.nome}"></c:out></td>

					<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img
							alt="Telefones" title="Telefones"
							src="resourses/img/telefones.png" width="30px" height="30px"></a></td>

					<td><a href="salvarUsuario?acao=delete&user=${user.id}"
						onclick="return confirm('Confirmar exclusão?');"><img
							src="resourses/img/excluir.png" alt="Excluir" title="Excluir"
							width="30px" height="30px"></a></td>

					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
							alt="Editar" title="Editar" src="resourses/img/editar.png"
							width="30px" height="30px"></a></td>


				</tr>
			</c:forEach>
		</table>
	</div>

	<script type="text/javascript">
		function validarCampos() {

			if (document.getElementById("login").value == '') {
				document.getElementById("login").focus();
				alert('Informe o Login');
				return false;
			} else if (document.getElementById("senha").value == '') {
				document.getElementById("senha").focus();
				alert("Informe a senha");
				return false;
			} else if (document.getElementById("nome").value == '') {
				document.getElementById("nome").focus();
				alert("Informe o nome");
				return false;
			} else if (document.getElementById("fone").value == '') {
				document.getElementById("fone").focus();
				alert("Informe o telefone");
				return false;
			}

			return true; //se todas os dados estiverem sidos informados corretamente, retornara true e deixara cadastrar!
		}

		function consultaCep() {
			var cep = $("#cep").val();

			//Consulta o webservice viacep.com.br/
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							//Atualiza os campos com os valores da consulta.
							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);

						} //end if.
						else {
							//CEP pesquisado não foi encontrado.
							$("#cep").val('');
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#estado").val('');
							$("#ibge").val('');
							alert("CEP não encontrado.");
						}
					});
		}
	</script>
</body>
</html>