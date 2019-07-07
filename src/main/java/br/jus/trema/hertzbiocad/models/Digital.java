package br.jus.trema.hertzbiocad.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import org.hibernate.annotations.Type;
import org.hibernate.envers.Audited;
import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.DateTime;

import br.jus.trema.vraptorbridge.models.AbstractEntity;

/**
 * 
 * @author Paulo Correa <paulo.correa@tre-ma.gov.br>
 *
 */

@NoArgsConstructor
@Getter
@Setter
@Entity
@Audited
@SequenceGenerator(name="seq", sequenceName = "sq_digital")
public class Digital extends AbstractEntity {

	private static final long serialVersionUID = -5859934194951515870L;
	
	@NotEmpty
	@Column(name = "matricula")
	private String matricula;
	
	@NotEmpty
	@Column(name="mao", length = 1)	
	private String mao;
	
	@NotEmpty	
	@Column(name="dedo", length = 1)	
	private String dedo;
	
	@Column(name = "status")
	private String status;
	
	@NotEmpty	
	@Column(name="digital", length = 4000)	
	private String digital;
	
	@NotNull
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentDateTime")
    private DateTime dataRegistro;
 
}
