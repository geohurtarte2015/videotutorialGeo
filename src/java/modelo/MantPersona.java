
package modelo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import objetos.Persona;



public class MantPersona {    
  
    private String bd="db_informacion";
    private String classfor="com.mysql.jdbc.Driver";
    private String url="jdbc:mysql://localhost/"+bd;
    private String usuario="root";
    private String clave="hurtarte";
    
    private Connection con=null;
    private PreparedStatement pr=null;
    private ResultSet rs=null;
    private String inserto="";
    private Persona Persona;
    
    
   
    
    public void insertar( Persona persona){
       
        String sql="Insert into datos(cedula,nombre,foto) values(?,?,?)";
        try
        {            
            Class.forName(classfor);
            con=DriverManager.getConnection(url, usuario,clave);
            pr=con.prepareStatement(sql);
            pr.setString(1,persona.getCedula());            
            pr.setString(2,persona.getNombre());    
        
            pr.setBlob(3,persona.getImagen()); 
            if(pr.executeUpdate()==1){
                inserto="Se inserto el producto de forma correcta";
            }else{
                inserto="No se pudo insertar al producto";
            }  
        }
        catch (Exception exception){
                        
            System.out.println("Exception : " + exception.getMessage() + "  "+"error en base de datos");
        }
        finally
	{
		if(con != null)
		{
			try
			{
                                pr.close();
				con.close();
			}
			catch (Exception ignored)
			{
				// ignore
			}
				
		}
	}
            
    }
    
    
    public Persona buscar(String cedula){
      
      Persona persona = new Persona();
        
      try{
            Class.forName(classfor);
            con=DriverManager.getConnection(url, usuario,clave);
            String sql="select cedula,nombre,foto from datos where cedula=?";
            pr=con.prepareStatement(sql);            
            pr.setString(1, cedula);                  
            rs = pr.executeQuery();  
      
        
    
      }catch(Exception exception){
          
          
          
          
      }
      
      
           
      return persona;
        
    }
    

    
    public void eliminar( String cedula){
        String sql="DELETE FROM datos WHERE cedula=?";
        try
        {
            Class.forName(classfor);
            con=DriverManager.getConnection(url, usuario,clave);
        
            pr=con.prepareStatement(sql);            
            pr.setString(1, cedula);            
                    
            pr.executeUpdate();              
            System.out.println("Eliminacion hecha con exito!");
            
                    
                    
        }
        catch (Exception exception){
                        
            System.out.println("Exception : " + exception.getMessage() + "  "+"error en base de datos");
        }
        finally
	{
		if(con != null)
		{
			try
			{
                                
				   pr.close();
                                   con.close();
			}
			catch (Exception ignored)
			{
				// ignore
			}
				
		}
	}
            
    }
    
    public void editar( Persona persona){
              String sql="Update datos set nombre=?, foto=? where cedula=?";
        try
        {
            Class.forName(classfor);
            con=DriverManager.getConnection(url, usuario,clave);            
            pr=con.prepareStatement(sql);            
            
            pr.setString(1,persona.getNombre()); 
            pr.setBlob(2,persona.getImagen()); 
            pr.setString(3,persona.getCedula());            
          
            if(pr.executeUpdate()==1){
                inserto="Se inserto el producto de forma correcta";
            }else{
                inserto="No se pudo insertar al producto";
            }  
        }
        catch (Exception exception){
                        
            System.out.println("Exception : " + exception.getMessage() + "  "+"error en base de datos");
        }
        finally
	{
		if(con != null)
		{
			try
			{
                                pr.close();
				con.close();
			}
			catch (Exception ignored)
			{
				// ignore
			}
				
		}
	}
            
    }
    
    public byte[] obtimagen( String cedula) {
        byte[] buffer = null;
        
        try
        {
            Class.forName(classfor);
            con=DriverManager.getConnection(url, usuario,clave);
            String sql="select foto from datos where cedula=?";
            pr=con.prepareStatement(sql);            
            pr.setString(1, cedula);                  
            rs = pr.executeQuery();     
            
            while (rs.next()){
                
                Blob bin = rs.getBlob("foto");
                
                 if (bin !=null){
                    InputStream inStream = bin.getBinaryStream();
                    int size = (int) bin.length();
                    buffer = new byte[size];
                    
                    try {inStream.read(buffer, 0, size);
                    
                    System.out.println("");
                    
                    } 
                    catch (IOException ex) {ex.printStackTrace();}
                 }                
            } //fin while  
            
            
            System.out.println("Mostrando imagen de cedula: "+ cedula);
                 
        }
        catch (Exception exception){
                        
            return null;
        }
         finally
	{
		if(con != null)
		{
			try
			{
                                
				   pr.close();
                                   con.close();
			}
			catch (Exception ignored)
			{
				// ignore
			}
				
		}
	}
        return buffer;
            
    }

            

    public ArrayList<Persona> buscar(){
        ArrayList<Persona> vecPro=new ArrayList<Persona>();
               
        String sql="SELECT * FROM datos";
        try
        {
            Class.forName(classfor);
            con=DriverManager.getConnection(url, usuario,clave);  
            pr=con.prepareStatement(sql);   
            rs=pr.executeQuery();
            
            while(rs.next()){
                Persona persona = new Persona();
                persona.setCedula(rs.getString("cedula"));
                persona.setNombre(rs.getString("nombre"));
                persona.setImagen(rs.getBinaryStream("foto"));
                vecPro.add(persona);           
            }
            
            System.out.println("Muestra de datos hecha con exito!");
            
        }
        catch (Exception exception){
                        
             exception.printStackTrace();
        }
        finally{
		if(con != null)
		{
			try
			{
                                
				con.close();
                                rs.close();
                                pr.close();
                                
			}
			catch (Exception ignored)
			{
				// ignore
			}
				
		}
	}
        
        return vecPro;
            
    }
    
    public ArrayList<Persona> buscarN( String cedula){
        
        ArrayList<Persona> vecPro=new ArrayList<Persona>();
               
        String sql="SELECT * FROM datos where cedula="+cedula;
        try
        {
            Class.forName(classfor);
            con=DriverManager.getConnection(url, usuario,clave);  
            pr=con.prepareStatement(sql);   
            rs=pr.executeQuery();
            
            while(rs.next()){
                Persona persona = new Persona();
                persona.setCedula(rs.getString("cedula"));
                persona.setNombre(rs.getString("nombre"));
                persona.setImagen(rs.getBinaryStream("foto"));
                vecPro.add(persona);           
            }
            
            System.out.println("Muestra de datos hecha con exito!");
            
        }
        catch (Exception exception){
                        
             exception.printStackTrace();
        }
        finally{
		if(con != null)
		{
			try
			{
                                
				con.close();
                                rs.close();
                                pr.close();
                                
			}
			catch (Exception ignored)
			{
				// ignore
			}
				
		}
	}
        
        return vecPro;
            
    }
        
        
    
    
    
    

    
   
    
    
    
    
}
