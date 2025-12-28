package pojo;

import java.util.HashSet;
import java.util.Set;

public class Categorii implements java.io.Serializable {


	private Long idcategorie;
	private String numeCategorie;
	private Set nominalizari = new HashSet(0);

	public Categorii() {
	}

	public Categorii(Long idcategorie, String nume_categorie, Set nominalizari) {
		this.idcategorie = idcategorie;
		this.numeCategorie = nume_categorie;
		this.nominalizari = nominalizari;
	}

	public Long getIdcategorie() {
		return this.idcategorie;
	}
	
	public void setIdcategorie(Long idcategorie) {
		this.idcategorie = idcategorie;
	}
	
	public String getNumeCategorie() {
		return this.numeCategorie;
	}

	public void setNumeCategorie(String nume_categorie) {
		this.numeCategorie = nume_categorie;
	}
	
	public void setNominalizari(Set nominalizari) {
		this.nominalizari = nominalizari;
	}
	public Set getNominalizari() {
		return this.nominalizari;
	}
}
