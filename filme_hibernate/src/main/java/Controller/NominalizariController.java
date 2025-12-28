package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Categorii;
import pojo.Filme;
import pojo.Nominalizari;
import DAOImpl.NominalizariDaoImpl;
import DAOImpl.HibernateUtil;
import org.hibernate.Session;


public class NominalizariController extends HttpServlet {

	Nominalizari nominalizare = new Nominalizari();
	NominalizariDaoImpl nominalizareDaoImpl = new NominalizariDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaNominalizare") != null) {
			// preluarea parametrilor de interes
			Long idfilm = java.lang.Long.parseLong(request.getParameter("idfilm"));
			Long idcategorie = java.lang.Long.parseLong(request.getParameter("idcategorie"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Categorii categorie = (Categorii) session.get(Categorii.class, idcategorie);
			Filme film = (Filme) session.get(Filme.class, idfilm);
			String titlu_nominalizare = request.getParameter("titluNominalizare");
			
			nominalizare.setFilme(film);
			nominalizare.setCategorii(categorie);
			nominalizare.setTitluNominalizare(titlu_nominalizare);

			nominalizareDaoImpl.adaugaNominalizare(nominalizare);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaNominalizare") != null) {
			List<Nominalizari> listaNominalizari = new ArrayList();
			listaNominalizari = nominalizareDaoImpl.afiseazaNominalizare();
			request.setAttribute("listaNominalizari", listaNominalizari);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Nominalizari.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaNominalizare") != null) {
			Long idnominalizare = Long.parseLong(request.getParameter("idnominalizare"));
			// preluarea parametrilor de interes
			Long idfilm = java.lang.Long.parseLong(request.getParameter("idfilm"));
			Long idcategorie = java.lang.Long.parseLong(request.getParameter("idcategorie"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Categorii categorie = (Categorii) session.get(Categorii.class, idcategorie);
			Filme film = (Filme) session.get(Filme.class, idfilm);
			String titlu_nominalizare = request.getParameter("titluNominalizare");
		
			nominalizareDaoImpl.modificaNominalizare(idnominalizare, film, categorie, titlu_nominalizare);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeNominalizare") != null) {
			Long idnominalizare = Long.parseLong(request.getParameter("idnominalizare"));
			nominalizare.setIdnominalizare(idnominalizare);
			nominalizareDaoImpl.stergeNominalizare(nominalizare);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}


