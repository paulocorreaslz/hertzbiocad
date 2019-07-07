<%@ page contentType="text/html; charset=UTF-8" %>

<title>Listagem de Estagiarios</title>

<ul class="breadcrumb breadcrumb-wrapper">
    <li><a href="${pageContext.request.contextPath}/estagiarios">Estagiarios</a> <span class="divider">/</span></li>
   	<li class="active">Listagem</li>
</ul>

<h2>Listagem de estagiários</h2>

<form class="form-inline" action="${pageContext.request.contextPath}/estagiario/busca" method="post">
	Matricula: <input type="text" class="input-small" placeholder="matricula" name="matricula" value="${estagiario.matricula}">  	 
	Nome: <input type="text" class="input-small" placeholder="nome" name="nome" value="${estagiario.nome}">
  	<button type="submit" class="btn">Pesquisar</button>
</form>

<table class="table table-striped">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome</th>		
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.content}" var="estagiario">
			<tr>
				<td>${estagiario.id}</td>
				<td>${estagiario.nome}</td>										
				<td class="actions">
					<a href="${pageContext.request.contextPath}/digital/novo/${estagiario.id}" class="btn btn-small" title="Cadastrar Digital"><i class="icon-plus-sign"></i></a>
					<a href="${pageContext.request.contextPath}/estagiario/${estagiario.id}" class="btn btn-small" title="Exibir"><i class="icon-file"></i></a>										
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<vrb:paginationLinks uri="/estagiario/paginar" page="${page}" />


 
