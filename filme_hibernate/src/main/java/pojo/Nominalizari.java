package pojo;


public class Nominalizari implements java.io.Serializable {


	private Long idnominalizare;
	private Filme filme;
	private Categorii categorii;
	private String titluNominalizare;

	public Nominalizari() {
	}

	public Nominalizari(Filme filme, Categorii categorii, String titlu_nominalizare) {
		this.filme = filme;
		this.categorii = categorii;
		this.titluNominalizare = titlu_nominalizare;
	}
	
	public Long getIdnominalizare() {
		return this.idnominalizare;
	}
	
	public void setIdnominalizare(Long idnominalizare) {
		this.idnominalizare = idnominalizare;
	}
	
	public Filme getFilme() {
		return this.filme;
	}
	
	public void setFilme(Filme filme) {
		this.filme = filme;
	}

	public Categorii getCategorii() {
		return this.categorii;
	}
	
	public void setCategorii(Categorii categorii) {
		this.categorii = categorii;
	}
	
	public String getTitluNominalizare() {
		return this.titluNominalizare;
	}

	public void setTitluNominalizare(String titlu_nominalizare) {
		this.titluNominalizare = titlu_nominalizare;
	}
	
}
