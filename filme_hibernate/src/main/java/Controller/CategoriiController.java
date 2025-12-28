package Controller;

import DAO.CategoriiDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Categorii;
import DAOImpl.CategoriiDaoImpl;


public class CategoriiController extends HttpServlet {

	Categorii categorie = new Categorii();
	CategoriiDaoImpl categoriiDaoImpl = new CategoriiDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaCategorie") != null) {
			String nume_categorie = request.getParameter("numeCategorie");
			categorie.setNumeCategorie(nume_categorie);
			categoriiDaoImpl.adaugaCategorie(categorie);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaCategorie") != null) {
			List<Categorii> listaCategorii = new ArrayList();
			listaCategorii = categoriiDaoImpl.afiseazaCategorie();
			request.setAttribute("listaCategorii", listaCategorii);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Categorii.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaCategorie") != null) {
			long id1 = Long.parseLong(request.getParameter("idcategorie"));
			String nume_categorie = request.getParameter("numeCategorie");
			categoriiDaoImpl.modificaCategorie(id1, nume_categorie);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeCategorie") != null) {
			long id2 = Long.parseLong(request.getParameter("idcategorie"));
			categorie.setIdcategorie(id2);
			categoriiDaoImpl.stergeCategorie(categorie);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}


