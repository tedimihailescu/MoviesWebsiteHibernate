package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Categorii;
import DAO.CategoriiDao;


public class CategoriiDaoImpl implements CategoriiDao{

    public void adaugaCategorie(Categorii categorie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(categorie);
        transaction.commit();
        session.close();
    }

    public List<Categorii> afiseazaCategorie() {
        List<Categorii> listaCategorii = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Categorii");
        listaCategorii = query.list();
        return listaCategorii;
    }

    public void modificaCategorie(long idcategorie, String nume_categorie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Categorii detaliicategorii = (Categorii) session.load(Categorii.class, idcategorie);
        detaliicategorii.setNumeCategorie(nume_categorie);
        session.update(detaliicategorii);
        transaction.commit();
        session.close();
    }

    public void stergeCategorie(Categorii categorie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(categorie);
        transaction.commit();
        session.close();
    }

}
