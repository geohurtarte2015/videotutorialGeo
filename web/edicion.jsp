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
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <title>EDICION</title>
    </head>
    <body>
        <form action="Editar" method="post">
            
             <% String nombre=(String)request.getAttribute("nombre");%>
             <% String cedula=(String)request.getAttribute("cedula");%>
            
            
        <table border="1">
               <tr bgcolor="#2E237C" style="color: #MM0023; font-weight: bold;">
                <td colspan="2" align="center">
                    <h1>EDITAR</h1>
                </td>   
                
            </tr>
          
            <tr>
                <td>Cedula</td>
                <td colspan="2" align="left">
                    <input type="text" value="<%= cedula%>" name="cedula">
                </td>   
                
            </tr>
            
            <tr><td>Nombre</td>
                <td colspan="2" align="left">
                    <input type="text" value="<%= nombre%>" name="nombre">
                </td>   
                
            </tr>
   
            <tr><td>Archivo</td>
                <td colspan="2" align="left"> 
                <input type="file" value="" name="archivo" >
               </td>
                
            </tr>
          
            <tr><td>Ingresar</td>
             <td><input type="submit" value="editar" name="Editar" ></td></tr>           
             
        
                
                
        </table>
        </form>
    </body>
</html>
