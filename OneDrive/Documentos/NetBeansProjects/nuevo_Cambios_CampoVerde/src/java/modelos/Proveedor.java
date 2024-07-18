package modelos;

public class Proveedor {

    private int IDproveedor;
    private String usuario;
    private String nombre;
    private String nombreEmpresa;
    private String ruc;
    private String telefono;

    public Proveedor() {
    }

    public int getIDproveedor() {
        return IDproveedor;
    }

    public void setIDproveedor(int IDproveedor) {
        this.IDproveedor = IDproveedor;
    }

    public String getusuario() {
        return usuario;
    }

    public void setusuario(String usuario) {
        this.usuario = usuario;
    }

    public String getnombre() {
        return nombre;
    }

    public void setnombre(String nombre) {
        this.nombre = nombre;
    }

    public String getnombreEmpresa() {
        return nombreEmpresa;
    }

    public void setnombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getruc() {
        return ruc;
    }

    public void setruc(String ruc) {
        this.ruc = ruc;
    }

    public String gettelefono() {
        return telefono;
    }

    public void settelefono(String telefono) {
        this.telefono = telefono;
    }
}
