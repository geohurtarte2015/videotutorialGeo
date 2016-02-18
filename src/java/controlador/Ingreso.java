package controlador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.Modelo;
import objetos.Persona;


@MultipartConfig(maxFileSize = 16177215)
public class Ingreso extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*response.setContentType("text/html;charset=UTF-8*/
        /*response.setContentType("multipart/form-data");*/
      
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

      PrintWriter out = response.getWriter();
        try {
                Persona persona= new Persona();
                Modelo mant = new Modelo();
                Part part = request.getPart("archivo");
                persona.setImagen(part.getInputStream());
                persona.setCedula(request.getParameter("cedula").toUpperCase());
                persona.setNombre(request.getParameter("nombre").toUpperCase());       
                mant.insertar(persona);
                response.sendRedirect("index.jsp");
             
        } finally {            
            out.close();
        }
    
    
    
    
    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
