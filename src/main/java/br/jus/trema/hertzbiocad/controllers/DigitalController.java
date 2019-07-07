package br.jus.trema.hertzbiocad.controllers;

import org.joda.time.DateTime;

import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.jus.trema.hertzbiocad.enums.AppRole;
import br.jus.trema.hertzbiocad.models.Digital;
import br.jus.trema.hertzbiocad.models.Estagiario;
import br.jus.trema.hertzbiocad.repositories.DigitalRepo;
import br.jus.trema.hertzbiocad.repositories.EstagiarioRepo;
import br.jus.trema.vraptorbridge.authorization.annotations.Permission;
import br.jus.trema.vraptorbridge.messages.Messenger;
import br.jus.trema.vraptorbridge.pagination.Page;
import br.jus.trema.vraptorbridge.pagination.Paginator;

/**
 * 
 * @author Paulo Correa <paulo.correa@tre-ma.gov.br>
 *
 */
@Resource
@Permission(AppRole.ADMIN)
public class DigitalController {
	
	private final Result result;
	private final Validator validator;	
	private final EstagiarioRepo estagiarioRepo;
	private final DigitalRepo digitalRepo;
	private final Messenger messenger;
	private final Paginator<Digital> paginator;
	
	
	public DigitalController(Result result, Validator validator,DigitalRepo digitalRepo, EstagiarioRepo estagiarioRepo, Messenger messenger) {
		this.result = result;
		this.validator = validator;		
		this.estagiarioRepo = estagiarioRepo;
		this.digitalRepo = digitalRepo;
		this.messenger = messenger;
		this.paginator = new Paginator<Digital>(digitalRepo);
	}
		
	@Get("/digital")
	public Page<Digital> list(Digital digital, int pagina) {
		result.include("digital", digital);						
		return paginator.paginate(digital, pagina, "matricula");
	}	
	
	@Get("/digital/paginar/{pagina}")
	public void paginating(Digital digital, int pagina) {
		result.redirectTo(this).list(digital, pagina);
	}
		
	@Get("/digital/{digital.id}")
	public Digital show(Digital digital) {		
		messenger.addInformation("O teste de captura de digital abaixo verifica se o estagiário está apto para acessar o sistema utilizando a Digital como chave de autenticação de segurança e não ocasiona em registro de ponto por parte do mesmo.");		
		return digitalRepo.find(digital.getId());
	}
	
	@Post("/digital/busca")
	public void find(String matricula) {
		Digital digital = new Digital();
		if (matricula != null) digital.setMatricula(matricula);		 	
		result.redirectTo(this).list(digital, 1);
	}
	
	@Get("/digital/novo/{iddigital}")
	public Digital newDigital(Long iddigital) {	
		messenger.addInformation("Preencha corretamente as informações sobre a Mão, o dedo e Captura de digital do estágiario para finalizar o cadastro.");		
		
		Estagiario estagiario = estagiarioRepo.find(iddigital);
		result.include("estagiario", estagiario);
		Digital digital = new Digital();
		digital.setMatricula(estagiario.getMatricula());	
		
		return new Digital();
	}
	
	@Post("/digital")
	public void create(Digital digital, String matricula, String digitalcap) {			
		digital.setMatricula(matricula); 
		digital.setDigital(digitalcap);
		digital.setDataRegistro(DateTime.now());
		validator.validate(digital);
		validator.onErrorUsePageOf(this).newDigital(digital.getId());		
		digitalRepo.save(digital);
		messenger.addSuccess("Digital salva com sucesso!");
		result.redirectTo(this).show(digital);
	}
	
	@Delete("/digital/{digital.id}")
	public void delete(Digital digital) {	
		digitalRepo.delete(digitalRepo.find(digital.getId()));
		messenger.addSuccess("Digital excluída com sucesso!");
		result.redirectTo(this).list(null, 1);  
	}
	
	@Get("/digital/estagiario/{matricula}")
	public void digitalEstagiario(String matricula) {
		Digital digital = new Digital();
		if (matricula != null) {
			digital.setMatricula(matricula); 
		}			
		result.redirectTo(this).list(digital, 1);
	}

}