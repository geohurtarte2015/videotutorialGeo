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
        
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <title>EDICION</title>
    </head>
    <body>
        
        <ul class="nav nav-tabs nav-justified">
            <li><a href="/videotutorialGeo/index.jsp">Inicio</a></li>
            <li class="active"><a href="/videotutorialGeo/edicion.jsp">Edicion</a></li>
            <li><a href="#">Reporte</a></li>
        </ul>
      
       
        <br>
        <br>
        <br>
      
        <div class="container-fluid" >   
        <form role="form" action="Editar" method="post">
          <% String nombre=(String)request.getAttribute("nombre");%>
          <% String cedula=(String)request.getAttribute("cedula");%>  
         <div class="form-group">    
          <div class="row">   
              <div class="col-sm-4" style="float: none; margin: 0 auto;">
               <label for="email" >Cedula</label>
               <input type="text" class="form-control" value="<%= cedula%>" name="cedula">
              </div>
          </div>
          
          <div class="form-group">
          <div class="row">
              <div class="col-sm-4" style="float: none; margin: 0 auto;">
               <label for="email" >Nombre</label>
               <input type="text" class="form-control" value="<%= nombre%>" name="nombre">
              </div>
          </div>
          </div>
          
          <div class="form-group">
          <div class="row">
              <div class="col-sm-4" style="float: none; margin: 0 auto;">
               <label for="email" >Archivo</label>
                <div class="fileinput fileinput-new" data-provides="fileinput">
                  <span class="btn btn-default btn-file"><span></span><input type="file" name="archivo" /></span>
                </div>
              </div>
          </div>
          </div>
          <div class="col-sm-4" style="float: none; margin: 0 auto;">    
                <button type="submit" name="Editar" class="btn btn-info" onClick="location.href='index.jsp'"> Ingresar </button>    
          </div>           
             
             
        </div>        
        </form>
        </div>
    </body>
</html>
