<%@ page contentType="text/html; charset=UTF-8" %>

<form action="${pageContext.request.contextPath}/turma" method="post">
	<!-- tem que ter a declaracao do id do curso pra poder instaciar direito o objeto -->
	<input type="hidden" name="turma.curso.id" value="${turma.curso.id}"/>
  
  	<!-- se a turma tiver ID, vai ser PUT (chama o método update) e nao POST(metodo create) -->
	<c:if test="${not empty turma.id}">
		<input type="hidden" name="_method" value="put"/>
		<input type="hidden" name="turma.id" value="${turma.id}"/>
	</c:if>

    <label>Nome do Curso:</label>
	<p>${turma.curso.nome}</p>

	<label>Nome:</label>
	<input type="text" class="input-xxlarge" name="turma.nome" value="${turma.nome}"/>

	<label>Carga horária:</label>
	<input type="text" class="input-xxlarge" name="turma.cargaHoraria" value="${turma.cargaHoraria}"/>


	<label>Conteúdo:</label>
	<textarea name="turma.conteudo" rows="10" class="input-xxlarge">${turma.conteudo}</textarea>


	<label>Data inicio: </label>
	<vrb:datetimepicker name="turma.dataInicial" value="${turma.dataInicial}" placeholder="Data de Inicio" />				
	
		
	<label>Data final: </label>
	<vrb:datetimepicker name="turma.dataFinal" value="${turma.dataFinal}" placeholder="Data de Termino" />				
	<p>
		<br/>
	  	<button type="submit" class="btn"><i class="icon-ok"></i> Salvar</button>
	  	<a href="${pageContext.request.contextPath}/turma" class="btn"><i class="icon-remove"></i> Cancelar</a>
  	</p>
</form>


