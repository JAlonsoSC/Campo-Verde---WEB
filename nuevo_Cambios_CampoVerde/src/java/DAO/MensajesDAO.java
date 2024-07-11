package DAO;

import java.util.List;
import modelos.Mensajes;

public interface MensajesDAO {
    void enviarMensaje(Mensajes mensaje) throws Exception;
    List<Mensajes> obtenerMensajesDisponibles(int emisorID, int receptorID) throws Exception;
}
