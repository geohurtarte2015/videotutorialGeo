
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
        <title>Mantenimiento</title>
    </head>
    <body>
        
        <ul class="nav nav-tabs nav-justified">
            <li class="active"> <a href="/videotutorialGeo/index.jsp">Inicio</a></li>
            <li>                <a href="/videotutorialGeo/edicion.jsp">Edicion</a></li>
            <li>                <a href="#">Reporte</a></li>
        </ul>
      
       
        <br>
        <br>
        <br>
   
      
        <div class="container-fluid" >    
             <h1>Ejemplo de ingreso de clientes</h1>
            <div class="panel panel-primary class">
                <div class="panel-heading"> Ingreso de datos </div>
                <div class="panel-body">
            <form role="form" action="Ingreso" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <div class="row">
             
                    <div class="col-sm-4" style="float: none; margin: 0 auto;">
                        <label for="email">Cedula</label>
                        <input type="text" class="form-control"  value="" name="cedula">
                    </div>
           
                </div>
             </div>        
        
            <div class="form-group">
                <div class="row">
                   <div class="col-sm-4" style="float: none; margin: 0 auto;">
                        <label for="email" >Nombre</label>
                        <input type="text" class="form-control" value="" name="nombre">
                   </div>
                </div>
            </div>      

         
            <div class="form-group">
                <div class="row">
                    <div class="col-sm-4" style="float: none; margin: 0 auto;">     
                        <label for="email">Archivo</label>
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                            <span class="btn btn-default btn-file"><span></span><input type="file" name="archivo" /></span>
                            </div>
                    </div>
                </div>    
            </div>            
            <div class="col-sm-4" style="float: none; margin: 0 auto;">    
            <button type="submit" name="Ingreso" class="btn btn-info" onClick="location.href='index.jsp'"> Ingresar </button>    
            </div> 
              <%=mensaje%>
            </form>
            </div>
           </div>
          </div>
           
        <br>
        <br>
  
     
        
        <div class="container">   
          <div class="Panel panel-success class"> 
              <div class="panel-heading">Lista de personas</div>
              <div class="panel-body"> 
              
                <div class="center-block">
                    <table class="table table-hover">         
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


                            <td id="persona"  align="left"><%= personaTemp.getNombre()%></td>


                            <td id="imagen"  style="width: 25px; text-align: center;">
                                 <a href="VerImagen?cedula=<%= personaTemp.getCedula()%>">
                                    <img src="img/lupa.png" width="16" height="16"  border="0" /> 
                                 </a>    
                             </td>


                            <td id="eliminar" style="width: 25px; text-align: center;">
                                 <a href="Eliminar?cedula=<%= personaTemp.getCedula()%>">
                                    <img src="img/eliminar.png" width="16" height="16"  border="0" />       
                                 </a>                            
                            </td>


                            <td   id="editar" style="width: 25px; text-align: center;">
                                 <a href="Buscar?cedula=<%= personaTemp.getCedula()%>">
                                    <img  src="img/pencil.png" width="16" height="16"  border="0" />       
                                 </a>                            
                            </td>

                        </tr>
                        <%}%>
                        </tbody>  
                       </table>
                    </div>
                  </div>
               </div>
            </div>
            
           
     
         <br>
    
        
    </body>
</html>
