package DAO;

import java.util.List;
import pojo.Categorii;

public interface CategoriiDao {
    public void adaugaCategorie (Categorii categorie);
    public List<Categorii> afiseazaCategorie();
    public void modificaCategorie (long idcategorie, String nume_categorie);
    public void stergeCategorie (Categorii categorie);
}
