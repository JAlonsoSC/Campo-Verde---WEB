package modelos;

import java.sql.Timestamp;

public class Contacto {

    private int idContacto;
    private String usuario;
    private String nombreCompleto;
    private String correo;
    private String telefono;
    private String ciudad;
    private String producto;
    private String mensaje;
    private Timestamp fecha;

    public Contacto() {
    }

    public Contacto(int idContacto, String usuario, String nombreCompleto, String correo, String telefono, String ciudad, String producto, String mensaje, Timestamp fecha) {
        this.idContacto = idContacto;
        this.usuario = usuario;
        this.nombreCompleto = nombreCompleto;
        this.correo = correo;
        this.telefono = telefono;
        this.ciudad = ciudad;
        this.producto = producto;
        this.mensaje = mensaje;
        this.fecha = fecha;
    }

    public int getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(int idContacto) {
        this.idContacto = idContacto;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }



  
}
