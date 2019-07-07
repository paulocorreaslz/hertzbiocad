<%@ page contentType="text/html; charset=UTF-8" %>

<title>Editando artigo</title>

<ul class="breadcrumb breadcrumb-wrapper">
       <li><a href="${pageContext.request.contextPath}/artigos">Artigos</a> <span class="divider">/</span></li>
   	<li class="active">Editar</li>
</ul>

<fieldset>
	<legend>Editando artigo</legend>
	<%@include file="form.jsp"%>
</fieldset>
