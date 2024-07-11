window.onload = function () {
    var chat = {};
    chat.socket = new WebSocket("ws://localhost:8080/CampoVerde_mensajes/websocket/chat");
    var pantallaChat;

    pantallaChat = document.getElementById('pantallaChat');
    pantallaChat.escribir = function (textoMensaje) {
        var p = document.createElement('p');
        p.style.wordWrap = 'break-word';
        p.innerHTML = textoMensaje;
        pantallaChat.appendChild(p);
        while (pantallaChat.childNodes.length > 25) {
            pantallaChat.removeChild(pantallaChat.firstChild);
        }
        pantallaChat.scrollTop = pantallaChat.scrollHeight;
    };

    chat.reportar = function (texto) {
        pantallaChat.escribir(texto);
    };

    chat.configurarCajaMensaje = function () {
        document.getElementById('cajaMensaje').onkeydown = function (event) {
            if (event.keyCode === 13) {
                chat.enviarMensaje();
                event.preventDefault();
            }
        };
    };

    chat.terminarChat = function () {
        document.getElementById('cajaMensaje').onkeydown = null;
        chat.reportar('Info: Se ha cerrado la conexión WebSocket');
    };

    chat.atenderMensajeServer = function (mensajeServer) {
        pantallaChat.escribir(mensajeServer.data);
    };

    chat.enviarMensaje = function () {
        var textoMensaje = document.getElementById('cajaMensaje').value;
        if (textoMensaje.trim() !== '') {
            chat.socket.send(textoMensaje);
            document.getElementById('cajaMensaje').value = '';
        }
    };

    // API de WebSocket en JavaScript
    chat.socket.onopen = function () {
        chat.reportar('Info: Se abrió una conexión WebSocket');
        chat.configurarCajaMensaje();
    };

    chat.socket.onclose = function () {
        chat.terminarChat();
    };

    chat.socket.onmessage = function (mensaje) {
        chat.atenderMensajeServer(mensaje);
    };

    chat.socket.onerror = function (error) {
        console.error('WebSocket Error: ', error);
    };
};
