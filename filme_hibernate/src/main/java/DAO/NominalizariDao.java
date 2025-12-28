package DAO;

import java.util.List;
import pojo.Nominalizari;
import pojo.Filme;
import pojo.Categorii;


public interface NominalizariDao {
    public void adaugaNominalizare (Nominalizari nominalizare);
    public List<Nominalizari> afiseazaNominalizare();
    public void modificaNominalizare (Integer idnominalizare, Filme film, Categorii categorie, String titlu_nominalizare);
    public void stergeNominalizare (Nominalizari nominalizare);
}

    
