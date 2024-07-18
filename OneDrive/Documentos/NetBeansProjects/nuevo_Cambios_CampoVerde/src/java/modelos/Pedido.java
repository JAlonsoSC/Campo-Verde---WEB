package modelos;

import java.util.List;

public class Pedido {
    
    private int id;
    private Usuario usuario;
    private String fecha;
    private Double monto;
    private String estado;
    
    private List<Carrito>detalleCompras;

    public Pedido(int id, Usuario usuario, String fecha, Double monto, String estado, List<Carrito> detalleCompras) {
        this.id = id;
        this.usuario = usuario;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
        this.detalleCompras = detalleCompras;
    }

    public Pedido() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<Carrito> getDetalleCompras() {
        return detalleCompras;
    }

    public void setDetalleCompras(List<Carrito> detalleCompras) {
        this.detalleCompras = detalleCompras;
    }
    
    
}