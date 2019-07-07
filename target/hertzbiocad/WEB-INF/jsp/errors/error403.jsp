<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><env:get key="app.name"/> - Acesso não autorizado</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/application.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive.css"/>
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body>		
		<div id="error_page" class="container">
			<div class="hero-unit">
		    	<h1><img src="${pageContext.request.contextPath}/img/logo-login.png" class="img-polaroid">Oops, erro 403!!!</h1>
		        <p>Desculpe, mas você não tem permissão para acessar esta página.</p>
		        <p>Verifique a URL que você digitou, clique <a href="javascript: history.go(-1)">aqui</a> para voltar ou vá para a <a href="${pageContext.request.contextPath}/login">página de login</a>.</p>
			</div>
		</div>	  	
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/application.js"></script>
	</body>
</html>
