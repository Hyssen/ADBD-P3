# MODELO RELACIONAL. VIVEROS
- Airam Herrera Plasencia
- Enrique Hernández Cabrera
## Imagen del modelo relacional
![Viveros_ADBD](https://github.com/user-attachments/assets/d3f63d2d-fc9a-4d8a-a329-b118c1c0c589)
## Imagen del diseño relacional
**PK:** Clave primaria; **FK:** Clave Foránea/ajena

**Cliente** (NIF, Nombre, Bonificaciones, , Fecha_ingreso, Volumen_Compra_Mensual GENERATED AS ())
**(PK):** NIF
___
**Pedidos:** (Codigo_pedido, importe, Fecha_pedido, Nombre_cliente, Forma_pago, NIF_Cliente)
**(PK):** Codigo_pedido
**(FK):** NIF_Cliente
___
