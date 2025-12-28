package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Filme;
import DAO.FilmeDao;


public class FilmeDaoImpl implements FilmeDao{

    public void adaugaFilm(Filme film) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(film);
        transaction.commit();
        session.close();
    }

    public List<Filme> afiseazaFilm() {
        List<Filme> listaFilme = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Filme");
        listaFilme = query.list();
        return listaFilme;
    }

    public void modificaFilm(long idfilm, String titlu, int an_aparitie, String regizor, long durata_minute, float nota_imdb) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Filme detaliifilme = (Filme) session.load(Filme.class, idfilm);
        detaliifilme.setTitlu(titlu);;
        detaliifilme.setAnAparitie(an_aparitie);
        detaliifilme.setRegizor(regizor);
        detaliifilme.setDurataMinute(durata_minute);
        detaliifilme.setNotaImdb(nota_imdb);
        session.update(detaliifilme);
        transaction.commit();
        session.close();
    }

    public void stergeFilm(Filme film) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(film);
        transaction.commit();
        session.close();
    }
}
