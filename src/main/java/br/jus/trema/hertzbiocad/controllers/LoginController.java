package br.jus.trema.hertzbiocad.controllers;

import lombok.RequiredArgsConstructor;
import net.vidageek.mirror.dsl.Mirror;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.environment.Environment;
import br.com.caelum.vraptor.validator.Validations;
import br.jus.trema.vraptorbridge.authentication.AuthenticationControl;
import br.jus.trema.vraptorbridge.authentication.annotations.Login;
import br.jus.trema.vraptorbridge.authentication.annotations.Public;
import br.jus.trema.vraptorbridge.authentication.components.LdapHandler;
import br.jus.trema.vraptorbridge.models.Application;
import br.jus.trema.vraptorbridge.models.User;
import br.jus.trema.vraptorbridge.repositories.ApplicationRepo;
import br.jus.trema.vraptorbridge.repositories.RoleRepo;
import br.jus.trema.vraptorbridge.repositories.UserRepo;

/**
 * 
 * @author Paulo Correa <paulo.correa@tre-ma.gov.br>
 *
 */
@Resource
@RequiredArgsConstructor
public class LoginController {
	
	private final Result result;
	private final Validator validator;
	private final LdapHandler ldapHandler;
	private final Environment environment;
	private final RoleRepo roleRepo;
	private final UserRepo userRepo;
	private final ApplicationRepo applicationRepo;
	private final AuthenticationControl authenticationControl;

	@Public
	@Get("/")
	public void index() {
		result.redirectTo(this).loginForm();
	}

	@Login
	@Get("/login")
	public void loginForm() {
	}
	
	@Public
	@Post("/login")
	public void login(final User user) {
		final Application application = applicationRepo.getByAcronym(environment.get("app.name"));
		
		validator.checking(new Validations() {{		
			if (that(user.getLogin() != null && user.getLogin().length() > 0, "user.login", "titulo.obrigatorio") &&
					that(user.getPassword() != null && user.getPassword().length() > 0, "user.password", "senha.obrigatorio")) {			
				
				User loggedUser = userRepo.getByLogin(user.getLogin());				
				if (that(userRepo.hasAccess(loggedUser, application), "usuario.login", "usuario.nao.possui.acesso")) {
					if (!Boolean.valueOf(environment.get("app.dev_mode"))) {
						that(ldapHandler.login(user.getLogin(), user.getPassword()), "usuario.login", "usuario.senha.invalidos");
					}
				}				
			}
		}});
		
		validator.onErrorUsePageOf(this).loginForm();
		
		User loggedUser = userRepo.getByLogin(user.getLogin());
		
		loggedUser.setRoles(roleRepo.getBy(loggedUser, application));
		
		authenticationControl.createSession(loggedUser);
		
		if (authenticationControl.getInterceptedMethod() != null) {
			Object redirect = result.redirectTo(authenticationControl.getInterceptedMethod().getResourceMethod().getResource().getType());
			new Mirror().on(redirect).invoke().method(authenticationControl.getInterceptedMethod().getResourceMethod().getMethod()).withArgs(authenticationControl.getInterceptedMethod().getMethodInfo().getParameters());
		} else {
			result.redirectTo(InicioController.class).index();
		}
		
	}
	
	@Path("/logout")
	public void logout() {
		authenticationControl.destroySession();
		result.redirectTo(this).loginForm();
	}
	
	
}
