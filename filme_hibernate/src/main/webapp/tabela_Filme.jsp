
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filme</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeFilm").hide();
                $("#modificaFilm").hide();

                $("#update").click(function () {
                    $("#modificaFilm").show();
                    $("#stergeFilm").hide();
                });
                $("#delete").click(function () {
                    $("#stergeFilm").show();
                    $("#modificaFilm").hide();
                });
            });
        </script>
		<link href="css/tabelaFilmeh.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <div>
    	<hr>
    	<hr>
        <h1 align="center"> Tabela Filme:</h1> 
        <form action="FilmeController" method="POST" name="afiseazaFilm">
        <table border="1" align="center">
            <tr>
                <td><b>IdFilm:</b></td>
                <td><b>Titlu:</b></td>
                <td><b>An Aparitie:</b></td>
                <td><b>Regizor:</b></td>
                <td><b>Durata Minute:</b></td>
                <td><b>Nota IMDb:</b></td>
            </tr>
            <c:forEach var="film" items="${listaFilme}">
                <tr>
                    <td>${film.idfilm}</td>
                    <td>${film.titlu}</td>
                    <td>${film.anAparitie}</td>
                    <td>${film.regizor}</td>
                    <td>${film.durataMinute}</td>
                    <td>${film.notaImdb}</td>

                </tr>
            </c:forEach>
        </table>
        <br/>
        
        <div align="center">
                Modifica: <input type="radio" id="update" name="modifica_sterge"onclick="document.getElementById('titlu').disabled = false;
                        document.getElementById('anAparitie').disabled = false;
                        document.getElementById('regizor').disabled = false;
                        document.getElementById('durataMinute').disabled = false;
                        document.getElementById('notaImdb').disabled = false;"> Sterge: <input type="radio" id="delete" 
                        name="modifica_sterge" onclick="document.getElementById('titlu').disabled = true;
                        document.getElementById('anAparitie').disabled = true;
                        document.getElementById('regizor').disabled = true;
                        document.getElementById('durataMinute').disabled = true;	
                        document.getElementById('notaImdb').disabled = true;"><br><br>
                <select name="idfilm">
                    <c:forEach items="${listaFilme}" var="film">
                        <option value="${film.idfilm}">${film.idfilm}</option>
                    </c:forEach>
                </select>
                <br><br>
                <table>
                	<tr>
                		<td align="right"> Modifica Titlu:</td>
                		<td><input id="titlu" type="text" name="titlu" required="required"></td>
                	</tr>
                	<tr>
                		<td align="right">Modifica An Aparitie:</td>
                		<td>
                			<select id="anAparitie" name="anAparitie">
							    <option value="2022">2022</option>
							    <option value="1950">1950</option>
							    <option value="1951">1951</option>
							    <option value="1952">1952</option>
							    <option value="1953">1953</option>
							    <option value="1954">1954</option>
							    <option value="1955">1955</option>
							    <option value="1956">1956</option>
							    <option value="1957">1957</option>
							    <option value="1958">1958</option>
							    <option value="1959">1959</option>
							    <option value="1960">1960</option>
							    <option value="1961">1961</option>
							    <option value="1962">1962</option>
							    <option value="1963">1963</option>
							    <option value="1964">1964</option>
							    <option value="1965">1965</option>
							    <option value="1966">1966</option>
							    <option value="1967">1967</option>
							    <option value="1968">1968</option>
							    <option value="1969">1969</option>
							    <option value="1970">1970</option>
							    <option value="1971">1971</option>
							    <option value="1972">1972</option>
							    <option value="1973">1973</option>
							    <option value="1974">1974</option>
							    <option value="1975">1975</option>
							    <option value="1976">1976</option>
							    <option value="1977">1977</option>
							    <option value="1978">1978</option>
							    <option value="1979">1979</option>
							    <option value="1980">1980</option>
							    <option value="1981">1981</option>
							    <option value="1982">1982</option>
							    <option value="1983">1983</option>
							    <option value="1984">1984</option>
							    <option value="1985">1985</option>
							    <option value="1986">1986</option>
							    <option value="1987">1987</option>
							    <option value="1988">1988</option>
							    <option value="1989">1989</option>
							    <option value="1990">1990</option>
							    <option value="1991">1991</option>
							    <option value="1992">1992</option>
							    <option value="1993">1993</option>
							    <option value="1994">1994</option>
							    <option value="1995">1995</option>
							    <option value="1996">1996</option>
							    <option value="1997">1997</option>
							    <option value="1998">1998</option>
							    <option value="1999">1999</option>
							    <option value="2000">2000</option>
							    <option value="2001">2001</option>
							    <option value="2002">2002</option>
							    <option value="2003">2003</option>
							    <option value="2004">2004</option>
							    <option value="2005">2005</option>
							    <option value="2006">2006</option>
							    <option value="2007">2007</option>
							    <option value="2008">2008</option>
							    <option value="2009">2009</option>
							    <option value="2010">2010</option>
							    <option value="2011">2011</option>
							    <option value="2012">2012</option>
							    <option value="2013">2013</option>
							    <option value="2014">2014</option>
							    <option value="2015">2015</option>
							    <option value="2016">2016</option>
							    <option value="2017">2017</option>
							    <option value="2018">2018</option>
							    <option value="2019">2019</option>
							    <option value="2020">2020</option>
							    <option value="2021">2021</option>
							    <option value="2022">2022</option>
							</select>
                		</td>
                	</tr>
                	<tr>
                		<td align="right">Modifica Regizor:</td>
                		<td><input id="regizor" type="text" name="regizor" required="required"> </td>
                	</tr>
                	<tr>
                		<td align="right">Modifica Durata Minute:</td>
                		<td><input id="durataMinute" type="number" min="10" max="420" name="durataMinute" required="required"></td>
                	</tr>
                	<tr>
                		<td align="right">Modifica Nota IMDb:</td>
                		<td><input id="notaImdb" type="number" name="notaImdb" step="0.01" min="1.0" max="10.0" required="required"></td>
                	</tr>
                </table>
                <br/>
                <button type="submit" id="modificaFilm" name="modificaFilm"> Modifica</button> 
                <button type="submit" id="stergeFilm" name="stergeFilm"> Sterge </button>
                <br/>
            </div>
        </form>
        <div align="center">
	        <table>
				<tr>
					<td><form action="adauga_Film.jsp" method="POST">
	            		<p align="center"><input type="submit" value="Adauga film"> &nbsp;<br>
	        			</p></form>
	        		</td>
	        		<td><form action="index.html" method="POST">
	            		<p align="center"><input type="submit" value="Home"> &nbsp; <br>
	        			</p></form>
	        		</td>
				</tr>
			</table>
        </div>
        <hr>
        <hr>
    </div>
    </body>
</html>
