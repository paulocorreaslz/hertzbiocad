<%@ page contentType="text/html; charset=UTF-8" %>

<title>Nova turma</title>

<ul class="breadcrumb breadcrumb-wrapper">
       <li><a href="${pageContext.request.contextPath}/turma">Turma</a> <span class="divider">/</span></li>
   	<li class="active">Novo</li>
</ul>

<fieldset>
	<legend>Nova turma</legend>
	<%@include file="form.jsp"%>
</fieldset>	
