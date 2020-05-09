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

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

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
							<li class="active"><a href="acessoliberado.jsp"> <i
									class="icon-home"></i> Inicio
							</a></li>
							<li><a href="index.jsp"> <i class="icon-signout"></i>
									Sair
							</a></li>

						</ul>
						<!--/.widget-nav-->

					</div>
					<!--/.sidebar-->
				</div>
				<!--/.span3-->

				<div class="span9">
					<div class="content">
						<div class="module">
							<div class="module-head" style="text-align: center;">
								<h2>Cadastro de Usuários</h2>
							</div>

							<div class="module-body">
								<form action="salvarUsuario" method="post" id="formUser"
									onsubmit="return validarCampos()? true : false;"
									enctype="multipart/form-data" class="form-inline">
									<!-- Executa antes de inviar para o servidor -->

									<div class="alert-success" style="text-align: center;">
										<button type="button" class="close" data-dismiss="alert"></button>
										${msg}
									</div>

									<div class="alert-error" style="text-align: center;">
										<button type="button" class="close" data-dismiss="alert"></button>
										${msg2}
									</div>

									<div class="input-prepend">
										<label class="control-label" for="basicinput">Codigo:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-barcode"> </i></span> <input
												type="text" id="id" name="id" value="${user.id}"
												class="span8" readonly="readonly">
										</div>
									</div>
									<div class="input-prepend">
										<label class="control-label" for="basicinput">Login:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-signout"> </i></span> <input
												type="text" id="login" name="login" value="${user.login}"
												class="span8" placeholder="informe o login" maxlength="10">
										</div>
									</div>
									<div class="input-prepend">
										<label class="control-label" for="basicinput">Senha</label>
										<div class="controls">
											<span class="add-on"><i class="icon-key"> </i></span> <input
												type="password" id="senha" name="senha" class="span8 tip"
												value="${user.senha}" placeholder="Informe a senha"
												maxlength="10">
										</div>
									</div>

									<div class="input-prepend">
										<label class="control-label" for="basicinput">Nome:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-user"> </i></span> <input
												type="text" id="nome" class="span8" name="nome"
												value="${user.nome}" placeholder="Informe o nome do usuário"
												maxlength="80">
										</div>
									</div>
									<div class="input-prepend">
										<label class="control-label" for="basicinput">Cep:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-share-alt"> </i></span> <input
												type="text" id="cep" name="cep" class="span8"
												onblur="consultaCep();" value="${user.cep}"
												placeholder="Informe o cep" maxlength="9">
										</div>
									</div>

									<div class="input-prepend">
										<label class="control-label" for="basicinput">Rua:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-share-alt"> </i></span> <input
												type="text" id="rua" name="rua" class="span8"
												value="${user.rua}" maxlength="50">
										</div>
									</div>

									<div class="input-prepend">
										<label class="control-label" for="basicinput">Bairro:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-share-alt"> </i></span> <input
												type="text" id="bairro" name="bairro" class="span8"
												value="${user.bairro}" maxlength="50">
										</div>
									</div>

									<div class="input-prepend">
										<label class="control-label" for="basicinput">Cidade:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-share-alt"> </i></span> <input
												type="text" id="cidade" name="cidade" value="${user.cidade}"
												class="span8" maxlength="50">
										</div>
									</div>
									<div class="input-prepend">
										<label class="control-label" for="basicinput">IBGE:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-share-alt"> </i></span> <input
												type="text" id="ibge" class="span8" name="ibge"
												value="${user.ibge}" maxlength="20">
										</div>
									</div>
									<div class="input-prepend">
										<label class="control-label" for="basicinput">Estado:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-share-alt"> </i></span> <input
												type="text" id="estado" name="estado" class="span8"
												value="${user.estado}" maxlength="50">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="basicinput">Perfil:</label>
										<div class="controls">
											<select id="perfil" name="perfil" tabindex="1"
												data-placeholder="" class="span8">

												<option value="nao_informado">[--SELECIONE--]</option>

												<option value="administrador"
													${user.perfil eq 'administrador' ?'selected' : '' }>Administrador(a)</option>

												<option value="secretario"
													${user.perfil eq 'secretario' ?'selected' : '' }>Secretário(a)</option>

												<option value="gerente"
													${user.perfil eq 'gerente' ?'selected' : '' }>Gerente</option>

												<option value="funcionario"
													${user.perfil eq 'funcionario' ?'selected' : '' }>Funcionario</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Sexo</label>
										<div class="controls">
											<input type="radio" name="sexo"
												${user.sexo eq 'masculino' ?'checked' : '' }
												value="masculino">Masculino</input> <input type="radio"
												name="sexo" ${user.sexo eq 'feminino' ? 'checked' : ''}
												value="feminino">Feminino</input>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Ativo</label>
										<div class="controls">
											<input type="checkbox" id="ativo" name="ativo"
												<%if (request.getAttribute("user") != null) {

				BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.isAtivo()) {
					out.print(" ");
					out.print("checked=\"checked\"");// será marcado caso o usuário for ativo
					out.print(" ");
				}
			}%>>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="basicinput">Foto:</label>
										<div class="controls">
											<input type="file" name="foto" class="span4">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="basicinput">Curriculo:</label>
										<div class="controls">
											<input type="file" name="curriculo" value="curriculo"
												input-prepend>
										</div>
									</div>



									<div class="control-group">
										<div class="controls">
											<input class="btn btn-large btn-primary" type="submit"
												value="Salvar" style="width: 173px"> <input
												class="btn btn-large btn-danger" type="submit"
												style="width: 173px" value="Cancelar"
												onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'" />
										</div>
									</div>
								</form>


								<form class="navbar-search pull-left input-append" method="post"
									action="servletPesquisa">
									<input type="text" class="span3" id="descricaoconsulta"
										name="descricaoconsulta" placeholder="Pesquisar usuário">
									<button class="btn" type="submit" value="pesquisar"
										class="icon-search">
										<i class="icon-search"></i>
									</button>
								</form>


								<table class="table table-bordered">
									<caption style="font-size: 15px;">Lista de usuários</caption>
									<tr>
										<th style="text-align: center;">Id</th>
										<th style="text-align: center;">Foto</th>
										<th style="text-align: center;">Curriculo</th>
										<th style="text-align: center;">Nome</th>
										<th style="text-align: center;">Login</th>
										<th style="text-align: center;">Telefones</th>
										<th colspan="2" style="text-align: center">Ações</th>
									</tr>
									<c:forEach items="${usuarios}" var="user">
										<tr>
											<td style="width: 150px"><c:out value="${user.id}"></c:out></td>

											<c:if test="${user.fotoBase64Miniatura.isEmpty() == false}">
												<td><a
													href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}"><img
														src='<c:out value="${user.fotoBase64Miniatura}"/>'
														alt="Imagem User" title="Imagem User" width="30px"
														height="30px"></a></td>
											</c:if>
											<c:if test="${user.fotoBase64Miniatura == null}">
												<td><img alt="Imagem User"
													src="resourses/img/userPadrao.png" width="40px"
													height="40px" onclick="alert('Não possui imagem!')">
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
											<td style="width: 150px"><c:out value="${user.login}"></c:out></td>

											<td style="text-align: center;"><a href="salvarTelefones?acao=addFone&user=${user.id}">
													<i class="icon-phone-sign" style="font-size: 25px;"
													 alt="Telefones" title="Telefones"> </i></a></td>

											<td style="text-align: center;"><a href="salvarUsuario?acao=delete&user=${user.id}"
												onclick="return confirm('Confirmar exclusão?');">
													<i class="icon-trash" alt="Excluir"
													title="Excluir" style="font-size: 25px;"></i></a></td>

											<td><a href="salvarUsuario?acao=editar&user=${user.id}">
													<i class="icon-edit" alt="Editar" title="Editar"
													style="font-size: 25px;"></i></a></td>


										</tr>

									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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

	<script src="resourses/scripts/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	<script
		src="resourses/scripts/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="resourses/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="resourses/scripts/flot/jquery.flot.js"
		type="text/javascript"></script>


</body>
</html>