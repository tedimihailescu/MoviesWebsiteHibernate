<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorie</title>
        <link href="css/adaugah.css" rel="stylesheet" type="text/css">
    </head>
    <body>
	<div>
		<hr>
		<hr>
        <div align="center" id="add">
            <h1> Adauga categorie:</h1>
            <br/>
            <form action="CategoriiController" method="GET">
                <table>
                    <tr>
                        <td> Nume Categorie: </td>
                        <td><input type="text" name="numeCategorie" required="required"></td>
                    </tr>
                    
                </table>
                <br/>
                <input type="submit" name="adaugaCategorie" value="Adauga">
            </form>
        </div>

        <div align="center">
	        <table>
				<tr>
					<td><form action="CategoriiController" method="POST">
	            		<p align="center"><input type="submit" name="afiseazaCategorie" value="Categorii"> &nbsp;<br>
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
