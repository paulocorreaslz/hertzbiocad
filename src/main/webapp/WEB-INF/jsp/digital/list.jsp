<%@ page contentType="text/html; charset=UTF-8" %>

<title>Listagem de Digital</title>

<ul class="breadcrumb breadcrumb-wrapper">
    <li><a href="${pageContext.request.contextPath}/digital">Digital</a> <span class="divider">/</span></li>
   	<li class="active">Listagem</li>
</ul>

<h2>Listagem de digital</h2>

<form class="form-inline" action="${pageContext.request.contextPath}/digital/busca" method="post">
	Matricula:<input type="text" class="input-small" placeholder="matricula" name="matricula" value="${digital.matricula}">  	 
  	<button type="submit" class="btn">Pesquisar</button>
</form>

<table class="table table-striped">
	<thead>
		<tr>	
			<th>Matricula</th>		
			<th>Mão</th>
			<th>Dedo</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.content}" var="digital">
			<tr>
				<td>${digital.matricula}</td>						
				<td>${digital.mao}</td>
				<td>${digital.dedo}</td>						
				<td class="actions">					
					<a href="${pageContext.request.contextPath}/digital/${digital.id}" class="btn btn-small" title="Exibir"><i class="icon-file"></i></a>								
					<a href="" onclick="return confirmSubmitForm('Você tem certeza?', 'form_${digital.id}');" class="btn btn-small" title="Excluir"><i class="icon-trash"></i></a>					
					<form id="form_${digital.id}" class="hide" action="${pageContext.request.contextPath}/digital/${digital.id}" method="post">
						<input type="hidden" name="_method" value="delete"/>
					</form>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<vrb:paginationLinks uri="/digital/paginar" page="${page}" />

<a href="${pageContext.request.contextPath}/digital/report" class="btn"><i class="icon-print"></i> Gerar relatório</a> 
 
