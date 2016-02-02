
<%@page import="objetos.Persona"%>
<%@page import="modelo.MantPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String mensaje="";
    if(request.getParameter("men")!=null){
        mensaje=request.getParameter("men");
    }

    MantPersona pro=new MantPersona();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="JavaScript" src ="script.js"> </script>
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <form action="Ingreso" method="post" enctype="multipart/form-data">
        <table border="1">
               <tr bgcolor="#2E237C" style="color: #MM0023; font-weight: bold;">
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
               <input type="file" value="" name="archivo" >
               </td>
                
            </tr>
          
            <tr><td>Ingresar</td>
             <td><input type="submit" value="ingreso" name="Ingreso"  onClick="location.href='index.jsp'"></td></tr>           
             
             <tr>
                    <td colspan="2" align="center"><%=mensaje%></td>
             </tr>
                
                
        </table>
        </form>
        <br>
        <br>
        
     
    
        <%
         MantPersona mantPersona= new MantPersona();
         for(Persona personaTemp: mantPersona.buscar()){ 
         String cedula = personaTemp.getCedula();
         %>
         <table  width="50" border="1">         
             
                 <td id="cedula"   align="left"><%= cedula%></td>
                 <td id="persona"   width="35"  height="35"  align="left"><%= personaTemp.getNombre()%></td>
                 
                 <td id="imagen"  align="center">
                 <a href="VerImagen?cedula=<%= personaTemp.getCedula()%>">
                    <img src="img/lupa.png" width="16" height="16"  border="0" /> 
                 </a>     
                  </td>
                 
                 <td id="eliminar" align="center">
                     <a href="Eliminar?cedula=<%= personaTemp.getCedula()%>">
                         <img src="img/eliminar.png" width="16" height="16"  border="0" />       
                      </a>                            
                 </td>
                 
                 <td id="editar" align="center">
                     <a href="">
                         <img src="img/pencil.png" width="16" height="16"  border="0" />       
                      </a>                            
                 </td>
                
                 
             </tr>  
         </table>
         <%}%>
           
     
         <br>
    
        
    </body>
</html>
