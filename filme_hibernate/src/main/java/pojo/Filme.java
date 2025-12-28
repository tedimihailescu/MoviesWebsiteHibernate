package pojo;

import java.util.HashSet;
import java.util.Set;

public class Filme implements java.io.Serializable {


	private Long idfilm;
	private String titlu;
	private Integer anAparitie;
	private String regizor;
	private Long durataMinute;
	private Float notaImdb;
	private Set nominalizari = new HashSet(0);

	public Filme() {
	}

	public Filme(Long idfilm, String titlu, Integer an_aparitie, String regizor, Long durata_minute, Float nota_imdb, Set nominalizari) {
		this.idfilm = idfilm;
		this.titlu = titlu;
		this.anAparitie = an_aparitie;
		this.regizor = regizor;
		this.durataMinute = durata_minute;
		this.notaImdb = nota_imdb;
		this.nominalizari = nominalizari;
	}

	public Long getIdfilm() {
		return this.idfilm;
	}
	
	public void setIdfilm(Long idfilm) {
		this.idfilm = idfilm;
	}
	
	public String getTitlu() {
		return this.titlu;
	}

	public void setTitlu(String titlu) {
		this.titlu = titlu;
	}
	
	public Integer getAnAparitie() {
		return this.anAparitie;
	}

	public void setAnAparitie(Integer an_aparitie) {
		this.anAparitie = an_aparitie;
	}
	
	public String getRegizor() {
		return this.regizor;
	}

	public void setRegizor(String regizor) {
		this.regizor = regizor;
	}
	
	public Long getDurataMinute() {
		return this.durataMinute;
	}
	
	public void setDurataMinute(Long durata_minute) {
		this.durataMinute = durata_minute;
	}
	
	public Float getNotaImdb() {
		return this.notaImdb;
	}
	
	public void setNotaImdb(Float nota_imdb) {
		this.notaImdb = nota_imdb;
	}
	
	public void setNominalizari(Set nominalizari) {
		this.nominalizari = nominalizari;
	}
	
	public Set getNominalizari() {
		return this.nominalizari;
	}
}