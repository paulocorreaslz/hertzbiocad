function today() {
    hoje = new Date();

    dia = hoje.getDate();
    mes = hoje.getMonth();
    ano = hoje.getYear();
    diaSemana = hoje.getDay();
    
    if (dia < 10) dia = "0" + dia;
    if (ano < 2000)	ano = "" + (1900 + ano);
    
    nomeDia = ['Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado'];
    nomeMes = ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];

    return (nomeDia[diaSemana] + ", " + dia + " de " + nomeMes[mes] + " de " + ano);
}

function confirmSubmitForm(msg, formId) {
	if (confirm(msg)) { 
        $("#" + formId).submit(); 
    }
    
    return false;
}

//List of HTML entities for escaping.
var htmlEscapes = {
  '<': '&lt;',
  '>': '&gt;',
  '"': '&quot;',
  "'": '&#x27;',
  '/': '&#x2F;'
};

// Regex containing the keys listed immediately above.
var htmlEscaper = /[<>"'\/]/g;

// Escape a string for HTML interpolation.
encodeHTML = function(string) {
  return ('' + string).replace(htmlEscaper, function(match) {
    return htmlEscapes[match];
  });
};