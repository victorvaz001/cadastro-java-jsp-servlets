<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!--  biblioteca do JSP -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--format Number   -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>


		<script src="resourses/javascript/jquery.min.js" type="text/javascript"></script>
		<script src="resourses/javascript/jquery.maskMoney.min.js" type="text/javascript"></script>

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



<meta charset="ISO-8859-1">
<title>Cadastro de produtos</title>
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
								<h2>Cadastro de Produtos</h2>
							</div>
							<div class="module-body">

								<form action="salvarProduto" method="post" id="formProduduct"
									onsubmit="return validarCamposProdutos()? true: false" class="form-inline">
									
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
												type="text" readonly="readonly" id="id" name="id"
												class="span8" value="${produto.id}" />
										</div>
									</div>
									<div class="input-prepend">
										<label class="control-label" for="basicinput">Nome:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-hdd"> </i></span> <input
												type="text" id="nome" name="nome" class="span8"
												value="${produto.nome}" maxlength="100"
												placeholder="Informe o nome do Produto"
												title="Informe o nome do Produto" />
										</div>
									</div>
									<div class="input-prepend">
										<label class="control-label" for="basicinput">Quantidade
											un:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-bar-chart"> </i></span> <input
												type="text" id="quantidade" name="quantidade" maxlength="7"
												class="span8" value="${produto.quantidade}"
												placeholder="Informe a quantidade"
												title="Informe a quantidade" />
										</div>
									</div>
									<!-- ValorEmTexto em valorEmTexto transforma o valor em um atributo -->
									<div class="input-prepend">
										<label class="control-label" for="basicinput">Valor
											R$:</label>
										<div class="controls">
											<span class="add-on"><i class="icon-money"> </i></span> <input
												type="text" id="valor" name="valor" data-thousands="."
												data-decimal="," data-precision="2" class="span8"
												value="${produto.valorEmTexto}" maxlength="8"
												placeholder="Informe o valor do produto"
												title="Informe o valor do produto" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="basicinput">Categoria:</label>
										<div class="controls">
											<select id="categorias" name="categoria_id" class="span8">
												<c:forEach items="${categorias}" var="cat">
													<!--  carregando o id da categoria -->
													<option value="${cat.id}" id="${cat.id}"
														<c:if test="${cat.id == produto.categoria_id}">
								<c:out value = "selected=selected" />
								</c:if>>
														<!-- sera mostrado na tela --> ${cat.nome}
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input class="btn btn-large btn-primary" type="submit"
										value="Salvar" /> <input class="btn btn-large btn-danger"
										type="submit" value="Cancelar"
										onclick="getElementById('formProduduct').action = 'salvarProduto?acao=reset'" />

								</form>

								<table class="table table-bordered">
									<caption style="font-size: 15px;">
										<b>Lista de Produtos</b>
									</caption>
									<tr>

										<th style="text-align: center;">Id</th>
										<th style="text-align: center;">Nome</th>
										<th style="text-align: center;">Quantidade</th>
										<th style="text-align: center;">Valor</th>
										<th colspan="2" style="text-align: center">Ações</th>

									</tr>

									<c:forEach items="${produtos}" var="produto">
										<tr>
											<td><c:out value="${produto.id}"></c:out></td>
											<td><c:out value="${produto.nome}"></c:out></td>
											<td><c:out value="${produto.quantidade}"></c:out></td>
											<td><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${produto.valor}" /></td>

											<td><a onclick="return confirm('Confirmar exclusão?');"
												href="salvarProduto?acao=delete&produto=${produto.id}">
													<i class="icon-trash" alt="excluir" title="Excluir"
													style="font-size: 25px;"></i>
											</a></td>

											<td><a href="salvarProduto?acao=editar&produto=${produto.id}">
													<i class="icon-edit" alt="Editar" title="Editar"
													style="font-size: 25px;"></i>
											</a></td>
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
		function validarCamposProdutos() {
			if (document.getElementById("nome").value == '') {
				document.getElementById("nome").focus();
				alert("Informe o nome");
				return false;
			} else if (document.getElementById("quantidade").value == '') {
				document.getElementById("quantidade").focus();
				alert("Informe a quantidade");
				return false;
			} else if (document.getElementById("valor").value == '') {
				document.getElementById("valor").focus();
				alert("Informe o valor");
				return false;
			}
			return true;
		}

		function getFocus() {
			document.get
		}
	</script>

	<script type="text/javascript">
		$(function() {
			$('#valor').maskMoney(); //mascara de dinheiro
		});

		$(document).ready(function() {
			$("#quantidade").keyup(function() {
				$("#quantidade").val(this.value.match(/[0-9]*/));
			});

		});
	</script>

	
	

		
	<script src="resourses/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="resourses/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="resourses/scripts/flot/jquery.flot.js" type="text/javascript"></script>
		
	

</body>
</html>