
<%@page import="objetos.Persona"%>
<%@page import="modelo.Modelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String mensaje="";
    if(request.getParameter("men")!=null){
        mensaje=request.getParameter("men");
    }

    Modelo pro=new Modelo();
%>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
          <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
          <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
          <script language="JavaScript" src ="script.js"> </script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <ul class="nav nav-tabs nav-justified">
            <li class="active"><a href="/videotutorialGeo/index.jsp">Inicio</a></li>
            <li><a href="/videotutorialGeo/edicion.jsp">Edicion</a></li>
            <li><a href="#">Reporte</a></li>
        </ul>
        
        <div class="container">
        <form action="Ingreso" method="post" enctype="multipart/form-data">
        <table class="table" border="1">
               <tr bgcolor="#2E237C" style="color: white; font-weight: bold;">
                <td colspan="2" align="center">
                    <h1>Ingresar a la base de datos</h1>
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
               <input type="file"  value="" name="archivo" >
               </td>
                
            </tr>
          
            <tr><td>Ingresar</td>
             <td><input type="submit" value="ingreso" name="Ingreso" class="btn btn-info" onClick="location.href='index.jsp'"></td></tr>           
             
             <tr>
                    <td colspan="2" align="center"><%=mensaje%></td>
             </tr>
             
            
                
        </table>
        </form>
        <br>
        <br>
        
     
        
                  
        <div class="center-block">
         <table border="1" style="width:30%" class="table table-hover">         
             <thead>
                 <tr>
                     <th>Cedula</th>
                     <th>Nombre</th>
                   
                 </tr>
             </thead>
            <tbody>
            <%
                Modelo modelo= new Modelo();
                for(Persona personaTemp: modelo.buscar()){ 
                String cedula = personaTemp.getCedula();
            %>    
            <tr>
                <td id="cedula"   align="left"><%= cedula%></td>
            </tr>
            <tr>
                <td id="persona"  align="left"><%= personaTemp.getNombre()%></td>
            </tr>
            <tr>
                <td id="imagen"  style="width: 25px; text-align: center;">
                     <a href="VerImagen?cedula=<%= personaTemp.getCedula()%>">
                        <img src="img/lupa.png" width="16" height="16"  border="0" /> 
                     </a>    
                 </td>
            </tr>
            <tr>
                <td id="eliminar" style="width: 25px; text-align: center;">
                     <a href="Eliminar?cedula=<%= personaTemp.getCedula()%>">
                        <img src="img/eliminar.png" width="16" height="16"  border="0" />       
                     </a>                            
                </td>
            </tr>
            <tr>
                <td   id="editar" style="width: 25px; text-align: center;">
                     <a href="Buscar?cedula=<%= personaTemp.getCedula()%>">
                        <img  src="img/pencil.png" width="16" height="16"  border="0" />       
                     </a>                            
                </td>
            <%}%>    
            </tr>
            
            </tbody>  
         </table>
        </div>
        </div>
        
           
     
         <br>
    
        
    </body>
</html>
