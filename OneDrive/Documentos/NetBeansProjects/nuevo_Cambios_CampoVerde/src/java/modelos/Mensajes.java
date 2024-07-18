package modelos;

import java.sql.Timestamp;

public class Mensajes {
    private int MensajeID;
    private int EmisorID;
    private int ReceptorID;
    private String mensaje;
    private Timestamp timestamp;

    // Getters y setters
    public int getMensajeID() {
        return MensajeID;
    }

    public void setMensajeID(int mensajeID) {
        MensajeID = mensajeID;
    }

    public int getEmisorID() {
        return EmisorID;
    }

    public void setEmisorID(int emisorID) {
        EmisorID = emisorID;
    }

    public int getReceptorID() {
        return ReceptorID;
    }

    public void setReceptorID(int receptorID) {
        ReceptorID = receptorID;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}
