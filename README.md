# BBDD_zapato_roto
    Base de Datos SQL para EDteam
    Hecho en MySQL
 
    Tablas:
        
        cliente
            id_cliente (clave primaria)
            nombre
            ap_paterno
            ap_materno
            pais

        producto
            id_producto (clave primaria)
            nombre
            presentacion
            valor

        movimiento (de inventario)
            id_movimiento (clave primaria)
            tipo_movimiento (entrada/salida)
            fecha
        
        mov_prod (para relacionar movimientos con productos)
            id_movimiento (clave foranea)
            id_producto (clave foranea)
            cantidad

        factura
            id_factura (clave primaria)
            id_cliente (clave foranea)
            id_movimiento (clave foranea)
            impuestos
            descuentos
            valor_a_pagar (campo calculado)

