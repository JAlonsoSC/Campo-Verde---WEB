package modelos;

import java.sql.Timestamp;

public class Mensaje {

    private int mensajeID;
    private int emisorID;
    private int receptorID;
    private String contenido;
    private Timestamp fecha;

    public Mensaje() {
    }

    public Mensaje(int mensajeID, int emisorID, int receptorID, String contenido, Timestamp fecha) {
        this.mensajeID = mensajeID;
        this.emisorID = emisorID;
        this.receptorID = receptorID;
        this.contenido = contenido;
        this.fecha = fecha;
    }

    // Getters y Setters
    public int getMensajeID() {
        return mensajeID;
    }

    public void setMensajeID(int mensajeID) {
        this.mensajeID = mensajeID;
    }

    public int getEmisorID() {
        return emisorID;
    }

    public void setEmisorID(int emisorID) {
        this.emisorID = emisorID;
    }

    public int getReceptorID() {
        return receptorID;
    }

    public void setReceptorID(int receptorID) {
        this.receptorID = receptorID;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }
}
