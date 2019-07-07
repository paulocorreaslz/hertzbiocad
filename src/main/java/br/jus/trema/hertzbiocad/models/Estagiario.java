package br.jus.trema.hertzbiocad.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * 
 * @author Paulo Correa <paulo.correa@tre-ma.gov.br>
 *
 */

@Data
@Entity
@Table(name = "vw_estagiario", schema = "estagiobio")
public class Estagiario implements Serializable {

	private static final long serialVersionUID = -5859934194951515870L;

	@Id
	@Column(name = "id")
	private Long id;
	
	@Column(name = "matricula")
	private String matricula;
	
	@Column(name = "nome")
	private String nome;
	
}
