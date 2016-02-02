/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package objetos;

import java.io.InputStream;


public class Persona {
    
    
    private String cedula;
    private String nombre;
    private String foto;
    private InputStream imagen;
    

    public String getCedula() {
        return cedula;
    }


    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }


    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public String getFoto() {
        return foto;
    }


    public void setFoto(String foto) {
        this.foto = foto;
    }


    public InputStream getImagen() {
        return imagen;
    }


    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }

            
    
}
