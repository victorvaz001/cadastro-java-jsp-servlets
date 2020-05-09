<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!--Tag jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Telefones</title>

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



</head>
<body>
	
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner" >
                <div class="container">
					<a class="brand" href="acessoliberado.html">Bem vindo ao sistema </a>
                    <div class="nav-collapse collapse navbar-inverse-collapse">
            
                        <ul class="nav pull-right">
                  
                            <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="resourses/img/user.png" class="nav-avatar" />
                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="salvarUsuario?acao=listartodos">Usuarios</a></li>
									<li><a href="salvarProduto?acao=listartodos">Produtos</a></li>
									<li><a href="acessoliberado.jsp">Inicio</a></li>
                                    <li class="divider"></li>
                                    <li><a href="index.jsp">Sair</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.nav-collapse -->
                </div>
            </div>
	</div><!-- /navbar -->
	
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">

						<ul class="widget widget-menu unstyled">
							<li class="active">
								<a href="acessoliberado.jsp">
									<i class="icon-home"></i>
									Inicio
								</a>
							</li>
							<li>
								<a href="index.jsp">
									<i class="icon-signout"></i>
									Sair
								</a>
							</li>
								
						</ul><!--/.widget-nav-->

					</div><!--/.sidebar-->
				</div><!--/.span3-->
	
	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head" style="text-align: center;">
					<h2>Cadastro de Telefones</h2>
					</div>
		<div class="module-body">

	<form action="salvarTelefones" method="post" id="formUser" class="form-inline"
		onsubmit="return validarCampos()? true : false">
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
			<label class="control-label" for="basicinput">Usuário:</label>
				<div class="controls">
					<span class="add-on"><i class="icon-barcode"> </i></span>
						<input type="text" id="user" readonly="readonly" class="span8"
							name="user" class="field-long" value="${userEscolhido.id}">
			</div>
		</div>
		<div class="input-prepend">
			<label class="control-label" for="basicinput">Nome:</label>
				<div class="controls">
				<span class="add-on"><i class="icon-user"> </i></span>
						<input type="text" id="nome" name="nome" class="span8"
							class="field-long" value="${userEscolhido.nome}"
							readonly="readonly"/>
			</div>
		</div>			
		
		<div class="input-prepend">
			<label class="control-label" for="basicinput">Numero:</label>
					<div class="controls">	
					<span class="add-on"><i class="icon-phone"> </i></span>
					<input type="text" id="numero" name="numero" 
					 class="span8" maxlength="20" placeholder="Digite somente números">
					
					
		
		</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="basicinput">Tipo:</label>
				<div class="controls">
						<select id="tipo" name="tipo" class="span8">
								<option>Casa</option>
								<option>Contato</option>
								<option>Celular</option>
								<option>Outros</option>
						</select>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input type="submit" value="Salvar" class="btn btn-large btn-primary"/> 
					<input type="submit" value="Voltar" class="btn btn-large btn-danger"
					onclick="document.getElementById('formUser').action = 'salvarTelefones?acao=voltar'"/>
		</div>
	</div>
	</form>
	
	
		<table class="table table-bordered"> 
			 <caption style="font-size: 15px;"><b>Lista de Telefones</b></caption>
			<tr>
			  <th style="text-align: center;">Id:</th>
			  <th style="text-align: center;">Numero:</th>
			  <th style="text-align: center;">Tipo:</th>
			  <th style="text-align: center">Excluir:</th>
			</tr>
			<c:forEach items="${telefones}" var="fone">
				<tr>
					<td style="text-align: center;"><c:out value="${fone.id}"></c:out></td>
					<td style="text-align: center;"><c:out value="${fone.numero}"></c:out></td>
					<td style="text-align: center;"><c:out value="${fone.tipo}"></c:out></td>
					<td style="text-align: center;"><a onclick="return confirm('Confirmar exclusão?');"
						href="salvarTelefones?user=${fone.usuario}&acao=deleteFone&foneId=${fone.id}">
							<i class="icon-trash" style="font-size: 25px; alt="Excluir" title="Excluir">
							 </i></a></td>
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
	
	<script type="text/javascript">

		$(document).ready(function() {
			$("#numero").keyup(function() {
				$("#numero").val(this.value.match(/[0-9]*/));
			});

		});
	</script>

	
		
	<script src="resourses/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="resourses/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="resourses/scripts/flot/jquery.flot.js" type="text/javascript"></script>
	
</body>
</html>