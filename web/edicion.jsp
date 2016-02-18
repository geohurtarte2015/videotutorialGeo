<%-- 
    Document   : edicion
    Created on : 5/02/2016, 10:01:49 PM
    Author     : Giovanni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDICION</title>
    </head>
    <body>
        <form action="Ingreso" method="post" enctype="multipart/form-data">
        <table border="1">
               <tr bgcolor="#2E237C" style="color: #MM0023; font-weight: bold;">
                <td colspan="2" align="center">
                    <h1>EDITAR</h1>
                </td>   
                
            </tr>
          
            <tr>
                <td>Cedula</td>
                <td colspan="2" align="left">
                    <input type="text" value="" name="cedula">
                </td>   
                
            </tr>
        
            <tr><td>Nombre</td>
                <td colspan="2" align="left">
                    <input type="text" value="" name="nombre">
                </td>   
                
            </tr>
   
            <tr><td>Archivo</td>
                <td colspan="2" align="left"> 
                <input type="file" value="" name="archivo" >
               </td>
                
            </tr>
          
            <tr><td>Ingresar</td>
             <td><input type="submit" value="ingreso" name="Ingreso"  onClick="location.href='index.jsp'"></td></tr>           
             
        
                
                
        </table>
        </form>
    </body>
</html>
