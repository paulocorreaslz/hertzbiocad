<%@ page contentType="text/html; charset=UTF-8" %>
<!-- NBioBSP Component -->
<OBJECT classid="CLSID:F66B9251-67CA-4d78-90A3-28C2BFAE89BF"		 
		height=0 width=0 VIEWASTEXT>
</OBJECT>


<!-- ----------------- --
  -- JavaScript Sample --
  -- ----------------- -->
<script lang='javascript'>
function regist(matricula)
{	
	var err, payload, teste;
	var result = false;

	
	// Check ID is not NULL
	if (matricula.value == '')
	{
		alert('Informe um estagiario antes de capturar uma digital !');
		return(false);
	}
   else{
			try // Exception handling
			{
				DEVICE_AUTO_DETECT	= 255;
				
				var objNBioBSP = new ActiveXObject('NBioBSPCOM.NBioBSP.1');
				var objDevice = objNBioBSP.Device;
				var objExtraction = objNBioBSP.Extraction;		
		
				// Open device. [AUTO_DETECT]
				// You must open device before enroll.
				objDevice.Open(DEVICE_AUTO_DETECT);
		
				err = objDevice.ErrorCode;	// Get error code	
				if ( err != 0 )		// Device open failed
				{
					alert('Erro ao conectar o dispositivo!');
				}
				else
				{
		
					// Enroll user's fingerprint.
					objExtraction.Enroll(payload);
					err = objExtraction.ErrorCode;	// Get error code
				
					if ( err != 0 )		// Enroll failed
					{
						alert('Falha ao registar digital! Numero do Erro: [' + err + ']');
					}
					else	// Enroll success
					{
						// Get text encoded FIR data from NBioBSP module.		
						document.getElementById('digitalcap').value = objExtraction.TextEncodeFIR;
						document.getElementById('digital-mini').src = '${pageContext.request.contextPath}/img/digital-mini-ok.png';
						alert('Digital capturada, conclua o cadastro!');
						document.getElementById('btndigital').disabled = true;						
						result = true;
					}
					
					// Close device. [AUTO_DETECT]
					objDevice.Close(DEVICE_AUTO_DETECT);
				}
		
				objExtraction = 0;
				objDevice = 0;
				objNBioBSP = 0;		
				
				//if ( result )
				//		{
				//			// Submit main form
				//			document.MainForm.submit();
				//		}
	
				return (result);
			}
			catch(e)
			{
				alert(e.message);
				return(false);
			}
	}
 /*	if ( result )
	{
		// Submit main form
		document.MainForm.submit();
	}
	return result;
	*/
}
</SCRIPT>

<form action="${pageContext.request.contextPath}/digital" method="post">
	<!-- tem que ter a declaracao do id do curso pra poder instaciar direito o objeto -->
	<input type="hidden" name="digital.id" value="${digital.id}"/>
  
  	<!-- se a turma tiver ID, vai ser PUT (chama o método update) e nao POST(metodo create) -->
	<c:if test="${not empty turma.id}">
		<input type="hidden" name="_method" value="put"/>
		<input type="hidden" name="digital.id" value="${digital.id}"/>
		<input type="hidden" name="estagiario.id" value="${estagiario.id}"/>
		
	</c:if>

	<label>Matricula:</label>
	${estagiario.matricula}
	<input type="hidden" name="matricula" value="${estagiario.matricula}"/>

	<label>Nome:</label>
	${estagiario.nome}

	<label>Mão:</label>
	<select name="digital.mao" size="2">
		<option value="D"> Direita </option>
		<option value="E"> Esquerda </option>
	</select>

	<label>Dedo:</label>
	<select name="digital.dedo" size="2">
		<option value="P"> Polegar </option>
		<option value="I"> Indicador </option>
		<option value="M"> Medio </option>
	</select>

	<input type="hidden" name="digitalcap" id="digitalcap">
	
 	<label>Digital:</label>
 	<img src="${pageContext.request.contextPath}/img/digital-mini-nao.png" name='digital-mini' id='digital-mini' /> 	
	
 	<p>
	<button type="button" class="btn" onclick="regist(${estagiario.matricula})" id='btndigital' name='btndigital'><i class="icon-hand-down"></i> Capturar Digital</button>
	</p>
	<p>
		<br/>
	  	<button type="submit" class="btn"><i class="icon-ok"></i> Salvar</button>
	  	<a href="${pageContext.request.contextPath}/digital" class="btn"><i class="icon-remove"></i> Cancelar</a>
  	</p>
</form>


