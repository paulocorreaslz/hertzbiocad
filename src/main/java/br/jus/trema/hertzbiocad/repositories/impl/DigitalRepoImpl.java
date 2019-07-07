package br.jus.trema.hertzbiocad.repositories.impl;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.jus.trema.hertzbiocad.models.Digital;
import br.jus.trema.hertzbiocad.repositories.DigitalRepo;
import br.jus.trema.vraptorbridge.repositories.impl.AbstractRepoImpl;

/**
 * 
 * @author Paulo Correa <paulo.correa@tre-ma.gov.br>
 *
 */
@Component
public class DigitalRepoImpl extends AbstractRepoImpl<Digital> implements DigitalRepo {
	
	public DigitalRepoImpl(EntityManager entityManager) {
		super(entityManager);
	}

	protected Criteria getPaginateCriteria(Digital digital) {
		Criteria criteria = super.getPaginateCriteria(digital);
		if (digital.getMatricula() != null) {
			//criteria.createCriteria("matricula").add(Restrictions.eq("matricula", digital.getMatricula()));
			criteria.add(Restrictions.eq("matricula", digital.getMatricula()));
			//acho que qualquer um dos dois serve, testa um e outro ai,
		}  
	
		return criteria;
	}
	
}
