package Controller;

import DAO.FilmeDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Filme;
import DAOImpl.FilmeDaoImpl;


public class FilmeController extends HttpServlet {

	Filme film = new Filme();
	FilmeDaoImpl filmeDaoImpl = new FilmeDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaFilm") != null) {
			String titlu = request.getParameter("titlu");
			Integer an_aparitie = java.lang.Integer.parseInt(request.getParameter("anAparitie"));
			String regizor = request.getParameter("regizor");
			Long durata_minute = java.lang.Long.parseLong(request.getParameter("durataMinute"));
			Float nota_imdb = java.lang.Float.parseFloat(request.getParameter("notaImdb"));
			film.setTitlu(titlu);
			film.setAnAparitie(an_aparitie);
			film.setRegizor(regizor);
			film.setDurataMinute(durata_minute);
			film.setNotaImdb(nota_imdb);
			filmeDaoImpl.adaugaFilm(film);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaFilm") != null) {
			List<Filme> listaFilme = new ArrayList();
			listaFilme = filmeDaoImpl.afiseazaFilm();;
			request.setAttribute("listaFilme", listaFilme);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Filme.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaFilm") != null) {
			long id1 = Long.parseLong(request.getParameter("idfilm"));
			String titlu = request.getParameter("titlu");
			Integer an_aparitie = java.lang.Integer.parseInt(request.getParameter("anAparitie"));
			String regizor = request.getParameter("regizor");
			Long durata_minute = java.lang.Long.parseLong(request.getParameter("durataMinute"));
			Float nota_imdb = java.lang.Float.parseFloat(request.getParameter("notaImdb"));
			filmeDaoImpl.modificaFilm(id1, titlu, an_aparitie, regizor, durata_minute, nota_imdb);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeFilm") != null) {
			long id2 = Long.parseLong(request.getParameter("idfilm"));
			film.setIdfilm(id2);
			filmeDaoImpl.stergeFilm(film);
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


