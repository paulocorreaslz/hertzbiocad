package br.jus.trema.hertzbiocad.controllers;

import lombok.RequiredArgsConstructor;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.jus.trema.vraptorbridge.messages.Messenger;

/**
 * 
 * @author Paulo Correa <paulo.correa@tre-ma.gov.br>
 *
 */
@Resource
@RequiredArgsConstructor
public class InicioController {

	private final Messenger messenger;
	
	@Get("/inicio")
	public void index() {	
		messenger.addInformation("Bem vindo ao Sistema de Cadastro de Digital para o Hertz Biometria.");
		messenger.addInformation("Para ter acesso a todas as funcionalidades do sistema, utilize o Internet Explorer.");
		
	}
	
}
