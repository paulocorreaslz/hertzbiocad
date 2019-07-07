package br.jus.trema.hertzbiocad.controllers;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.jus.trema.hertzbiocad.enums.AppRole;
import br.jus.trema.hertzbiocad.models.Estagiario;
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
public class EstagiarioController {
	
	private final Result result;
	private final Validator validator;	
	private final EstagiarioRepo estagiarioRepo;
	private final Messenger messenger;
	private final Paginator<Estagiario> paginator;
	
	
	public EstagiarioController(Result result, Validator validator,EstagiarioRepo estagiarioRepo, Messenger messenger) {
		this.result = result;
		this.validator = validator;		
		this.estagiarioRepo = estagiarioRepo;
		this.messenger = messenger;
		this.paginator = new Paginator<Estagiario>(estagiarioRepo);
	}
		
	@Get("/estagiarios")
	public Page<Estagiario> list(Estagiario estagiario, int pagina) {
		result.include("estagiario", estagiario);						
		return paginator.paginate(estagiario, pagina, "matricula");
	}	
	
	@Get("/estagiario/paginar/{pagina}")
	public void paginating(Estagiario estagiario, int pagina) {
		result.redirectTo(this).list(estagiario, pagina);
	}
			
	@Get("/estagiario/{estagiario.id}")
	public Estagiario show(Estagiario estagiario) {
		return estagiarioRepo.find(estagiario.getId());
	}
	
	@Post("/estagiario/busca")
	public void find(String matricula, String nome) {
		Estagiario estagiario = new Estagiario();
		if (matricula != null) estagiario.setMatricula(matricula);
		if (nome != null) estagiario.setNome(nome); 		
		result.redirectTo(this).list(estagiario, 1);
	}
	
}