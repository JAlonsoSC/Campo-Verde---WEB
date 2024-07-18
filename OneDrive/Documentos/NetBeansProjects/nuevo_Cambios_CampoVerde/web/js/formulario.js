
$(document).ready(function () {
    $('#solicitud-formulario').on('submit', function (e) {
        e.preventDefault();

        $.ajax({
            url: 'https://formsubmit.co/alonsosuana26@gmail.com',
            method: 'POST',
            data: $(this).serialize(),
            success: function () {
                $('#solicitud-formulario').hide();
                $('#confirmacion').show();
            },
            error: function () {
                alert('Hubo un error al enviar el mensaje. Por favor, intenta de nuevo.');
            }
        });
    });
});


$(document).ready(function() {
    $('.delete-link').click(function(e) {
        e.preventDefault(); // Evita que el enlace ejecute su acción por defecto

        var temaId = $(this).data('id'); // Obtiene el ID del tema desde el atributo data-id

        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false
        });

        swalWithBootstrapButtons.fire({
            title: '¿Estás seguro de eliminar este Tema?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, eliminar!',
            cancelButtonText: 'Cancelar',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Redirige al servlet para eliminar el tema
                window.location.href = 'CrearTema?accion=Eliminar&eliminarTema=' + temaId;
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                swalWithBootstrapButtons.fire(
                    'Cancelado',
                    'Tu tema está seguro :)',
                    'error'
                );
            }
        });
    });
});

