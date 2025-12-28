package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Categorii;
import pojo.Filme;
import pojo.Nominalizari;
import DAO.NominalizariDao;

public class NominalizariDaoImpl {
	
	public void adaugaNominalizare(Nominalizari nominalizare) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(nominalizare);
        transaction.commit();
        session.close();
    }

    public List<Nominalizari> afiseazaNominalizare() {
        List<Nominalizari> listaNominalizari = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Nominalizari");
        listaNominalizari = query.list();
        return listaNominalizari;
    }

    public void modificaNominalizare(Long idnominalizare, Filme film, Categorii categorie, String titlu_nominalizare) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Nominalizari detaliinominalizari = (Nominalizari) session.load(Nominalizari.class, idnominalizare);
        detaliinominalizari.setFilme(film);
        detaliinominalizari.setCategorii(categorie);
        detaliinominalizari.setTitluNominalizare(titlu_nominalizare);
        session.update(detaliinominalizari);
        transaction.commit();
        session.close();
    }

    public void stergeNominalizare(Nominalizari nominalizare) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(nominalizare);
        transaction.commit();
        session.close();
    }

}
