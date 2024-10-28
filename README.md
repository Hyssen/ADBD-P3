# MODELO RELACIONAL. VIVEROS
- Airam Herrera Plasencia
- Enrique Hernández Cabrera
## Imagen del modelo relacional
![Viveros_ADBD](https://github.com/user-attachments/assets/d3f63d2d-fc9a-4d8a-a329-b118c1c0c589)
## Imagen del diseño relacional
**PK:** Clave primaria; **FK:** Clave Foránea/ajena

**Cliente** (NIF, Nombre, , Fecha_ingreso, Volumen_Compra_Mensual GENERATED AS (????) Bonificaciones GENERATED AS(????))  
**(PK):** NIF

**Pedidos:** (Codigo_pedido, importe, Fecha_pedido, Nombre_cliente, Forma_pago, NIF_Cliente)  
**(PK):** Codigo_pedido  
**(FK):** NIF_Cliente

**Empleado:** (NIF, Nombre, Seguridad_Social)   
**(PK):** NIF

**Vivero:** (ID, Nombre, Latitud, longitud, Teléfono)  
**(PK):** ID

**Zona:** (Codigo_de_zona, Nombre, latitud, longitud)  
**(PK):** Codigo_de_zona

**Productos:** (Codigo_producto, Nombre, Tipo, Unidades_Totales, Stock, Unidades_Vendidas GENERATED AS (Unidades_Totales - Stock)  
**(PK):** Codigo_producto

**Trabaja_zona:** (NIF_Empleado, Codigo_zona, Fecha_inicio, Fecha_Final)  
**(PK):** NIF_Empleado, Codigo_zona  
**(FK):** NIF_Empleado, Codigo_zona

**Pedido_Producto:** (Codigo_pedido , Codigo_producto)  
**(PK):** Codigo_pedido , Codigo_producto  
**(FK):** Codigo_pedido , Codigo_producto

**Zona_Vivero:** (Codigo_zona, ID_vivero)  
**(PK):** Codigo_zona, ID_vivero  
**(FK):** Codigo_zona, ID_vivero



