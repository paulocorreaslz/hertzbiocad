<%@ page contentType="text/html; charset=UTF-8" %>

<title>Exibindo Estagiário</title>

<ul class="breadcrumb breadcrumb-wrapper">
       <li><a href="${pageContext.request.contextPath}/estagiario">Estagiários</a> <span class="divider">/</span></li>
   	<li class="active">Exibir</li>
</ul>

<h2>Estagiário</h2>

<p>Nome: ${estagiario.nome}</p>
<p>Matricula: ${estagiario.matricula}</p>
<p>Lotação: </p>
<p>
	<br/>
	<a href="${pageContext.request.contextPath}/estagiario" class="btn"><i class="icon-list"></i> Listagem</a>
</p>
