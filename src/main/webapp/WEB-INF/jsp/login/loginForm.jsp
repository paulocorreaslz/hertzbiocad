<%@ page contentType="text/html; charset=UTF-8" %>

<title>Login</title>

<div id="login-errors" class="container">
	<c:if test="${not empty errors}">
		<c:forEach items="${errors}" var="error">
			<div class="alert alert-error">
	  			<button type="button" class="close" data-dismiss="alert">x</button>
	  			<strong>Erro!</strong> ${error.message}
			</div>
		</c:forEach>
	</c:if>
</div>

<div id="login" class="container">
    <div class="fields_box">
    <form id="login-form" action="${pageContext.request.contextPath}/login" method="post">
        <h2 class="form-signin-heading"><env:get key="app.name"/></h2>
        <div class="input-prepend">
            <span class="add-on"><i class="icon-user"></i></span>
      		<input type="text" name="user.login" value="${user.login}" placeholder="Título" />
        </div>
        <br/>
 		<div class="input-prepend">
            <span class="add-on"><i class="icon-cog"></i></span>
     		<input type="password" name="user.password" value="${user.password}" placeholder="Senha" />
        </div>
        <br/>
        <button class="btn btn-primary" type="submit">Entrar</button>
    </form>
    </div>
    <div class="logo_box">
        <img src="${pageContext.request.contextPath}/img/logo-login.png" />
    </div>
</div>


