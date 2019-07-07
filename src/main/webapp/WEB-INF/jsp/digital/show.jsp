<%@ page contentType="text/html; charset=UTF-8" %>

<!-- NBioBSP Component -->
<OBJECT classid="CLSID:F66B9251-67CA-4d78-90A3-28C2BFAE89BF"		 
		height=0 width=0 VIEWASTEXT>
</OBJECT>


<!-- ----------------- --
  -- JavaScript Sample --
  -- ----------------- -->
<script lang='javascript'>

function capture(matricula)
{	
	var err;
	var result = false;
	
	// Check ID is not NULL
	if ( matricula.value == '' )
	{
		alert('Matricula não informada!');
		return(false);
	}
	
	try // Exception handling
	{
		DEVICE_AUTO_DETECT	= 255;
	
		var objNBioBSP = new ActiveXObject('NBioBSPCOM.NBioBSP.1');
		var objDevice = objNBioBSP.Device;
		var objExtraction = objNBioBSP.Extraction;

		// Open device. [AUTO_DETECT]
		// You must open device before capture.
		objDevice.Open(DEVICE_AUTO_DETECT);

		err = objDevice.ErrorCode;	// Get error code	
		if ( err != 0 )		// Device open failed
		{
			alert('Falha ao detectar dispositivo, verifique se esta conectado!!');			
		}
		else
		{
			// Capture user's fingerprint.
			objExtraction.Capture();
			err = objExtraction.ErrorCode;	// Get error code
		
			if ( err != 0 )		// Capture failed
			{
				alert('Falha na Captura! Error Number : [' + err + ']');			
				
			}
			else	// Capture success
			{
				// Get text encoded FIR data from NBioBSP module.
				document.MainForm.FIRTextData.value = objExtraction.TextEncodeFIR;
				alert('Digital Capturada com sucesso!');
				result = true;
			}
		
			// Close device. [AUTO_DETECT]
			objDevice.Close(DEVICE_AUTO_DETECT);
		}
				
		objExtraction = 0;
		objDevice = 0;		
		objNBioBSP = 0;
	}
	catch(e)
	{
		alert(e.message);
		return(false);
	}
	
	if ( result )
	{
		// Submit main form		
		document.MainForm.submit();
	}
	
	return (result);
}

</script>

<title>Exibindo Digital</title>

<ul class="breadcrumb breadcrumb-wrapper">
       <li><a href="${pageContext.request.contextPath}/digital">Digital</a> <span class="divider">/</span></li>
   	<li class="active">Exibir</li>
</ul>

<h2>Digital</h2>

<p>Matricula: ${digital.matricula}</p>

<p>Mao: ${digital.mao}</p>

<p>Dedo: ${digital.dedo}</p>

<p>
<button type="button" class="btn" onclick="capture(${digital.matricula});" id='btndigital' name='btndigital'><i class="icon-hand-down"></i> Testar Digital</button>
</p>

<form action='http://intranet.tre-ma.gov.br:81/hertz2/HertzbiocadVerify_object.asp' name='MainForm' method='post' OnSubmit='javascript:return false;' target='_blank' >
<input id='mat' type=hidden name='mat' value='${digital.matricula}' />
<input id='FIRTextData' type=hidden name='FIRTextData' />
</form>

<p>
	<br/>
	<a href="${pageContext.request.contextPath}/digital" class="btn"><i class="icon-list"></i> Listagem</a>
</p>
