<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><env:get key="app.name"/> - <decorator:title /></title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/application.css"/>
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
  		<decorator:head/>
  		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	</head>
	<body>
	  	<div id="topo">
	        <div class="logo pull-left">
	            <a href="${pageContext.request.contextPath}/inicio"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
	        </div>
	        <div class="user-info pull-right">
	            <ul class="unstyled">
	                <li><strong>Usuário:</strong> ${authenticationControl.loggedUser.name} (${authenticationControl.loggedUser.login})</li>
	                <li><strong>Lotação:</strong> ${authenticationControl.loggedUser.department}</li>
	                <li><strong>Perfil:</strong> ${authenticationControl.loggedUser.roleNames}</li>
	            </ul>
	        </div>
	    </div>
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">
				<div class="container">
					<div class="nav-collapse collapse">
						<vrb:menu menuList="${authenticationControl.menuList}" />						
		                <a class="btn pull-right" href="${pageContext.request.contextPath}/logout">SAIR</a>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
	
		<div class="container">
	    	<div id="main">
			    <!--errors-->
				<c:if test="${not empty errors}">
					<c:forEach items="${errors}" var="error">
						<div class="alert alert-error">
				  			<button type="button" class="close" data-dismiss="alert">x</button>
				  			<strong>Erro!</strong> <span class="capitalize">${error.category}</span> ${error.message}.
						</div>
					</c:forEach>
				</c:if>	
				
				<!-- messages -->
				<c:if test="${not empty messages}">
					<vrb:message messageList="${messages}" />					
				</c:if>
	    	
	      		<!--Body content-->
				<decorator:body/>
				
				<footer class="footer-wrapper">
			   		<hr>
			        <p class="pull-right data"></p>
					<p>&copy; 2013 <a href="<env:get key="app.tre.url"/>" target="_blank"><env:get key="app.tre.acronym"/></a> - <env:get key="app.tre.name"/></p>
				</footer>
    		</div>
		</div>
	  	
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.pt-BR.js"></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.bootpag.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/application.js"></script>
		<script type="text/javascript">$("p.data").html(today());</script>
	</body>
</html>
