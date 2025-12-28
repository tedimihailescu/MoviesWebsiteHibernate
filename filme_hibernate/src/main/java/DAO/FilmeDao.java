package DAO;

import java.util.List;
import pojo.Filme;

public interface FilmeDao {
    public void adaugaFilm (Filme film);
    public List<Filme> afiseazaFilm();
    public void modificaFilm (long idfilm, String titlu, int an_aparitie, String regizor, long durata_minute, float nota_imdb);
    public void stergeFilm (Filme film);
}
