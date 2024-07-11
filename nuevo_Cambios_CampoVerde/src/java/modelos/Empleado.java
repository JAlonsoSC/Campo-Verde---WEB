package modelos;

public class Empleado {

    int IdEmpleado;
    String Dni;
    String Nombres;
    String Telefono;
    String Correo;
    String Cargo;
    String Area;
    String User;
    String Contrasena;
    String Estado;

    public Empleado() {
    }

    public Empleado(String Dni, String Nombres, String Telefono, String Correo, String Cargo, String Area, String User, String Contrasena, String Estado) {
        this.Dni = Dni;
        this.Nombres = Nombres;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Cargo = Cargo;
        this.Area = Area;
        this.User = User;
        this.Contrasena = Contrasena;
        this.Estado = Estado;
    }

    public int getIdEmpleado() {
        return IdEmpleado;
    }

    public void setIdEmpleado(int IdEmpleado) {
        this.IdEmpleado = IdEmpleado;
    }

    public String getDni() {
        return Dni;
    }

    public void setDni(String dni) {
        this.Dni = dni;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String nombres) {
        this.Nombres = nombres;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String telefono) {
        this.Telefono = telefono;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String correo) {
        this.Correo = correo;
    }

    public String getCargo() {
        return Cargo;
    }

    public void setCargo(String cargo) {
        this.Cargo = cargo;
    }
    
    public String getArea() {
        return Area;
    }
    
    public void setArea (String area){
        this.Area = area;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String user) {
        this.User = user;
    }

    public String getContrasena() {
        return Contrasena;
    }

    public void setContrasena(String contrasena) {
        this.Contrasena = contrasena;
    }
    
    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        this.Estado = estado;
    }
}
