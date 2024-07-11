/* global swal */

$(document).ready(function(){
    $("tr #btnDelete").click(function(){
        var idp=$(this).parent().find("#idp").val();
        swal({
            title: "Quieres eliminar este producto?",
            text: "Una vez eliminado no se podra recuperar la venta",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminar (idp);
                        swal("Producto eliminado con exito", {
                            icon: "success",
                        }).then((willDelete)=>{
                            if(willDelete){
                                parent.location.href="controllerProducto?accion=Carrito";
                            }
                        });
                    } else {
                        swal("No se elimino");
                    }
                });
    });
    
    function eliminar(idp){
        var url = "controllerProducto?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp= " + idp,
            success: function (data, textStatus, jqXHR){
            }
        });
    }
    
    $("tr #cantidad").click()(function(){
        var idp = $(this).parent().find("#idpro").val();
        var cantidad = $(this).parent().find("#cantidad").val();
        var url = "controllerProducto?accion=Actualizar";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp + "&cantidad=" + cantidad,
            success: function (data, textStatus, jqXHR){
                location.href="controllerProducto?accion=Carrito";
                
            }
        });
    });
});


