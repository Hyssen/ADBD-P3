# MODELO RELACIONAL. VIVEROS
- Airam Herrera Plasencia
- Enrique Hernández Cabrera
## Imagen del modelo relacional
[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/Viveros_modelo_ER.png)
## Imagen del diseño relacional
**PK:** Clave primaria; **FK:** Clave Foránea/ajena

**Cliente** (NIF, Nombre, , Fecha_ingreso, Volumen_Compra_Mensual GENERATED ALWAYS AS (Numero_Compras / 12), Bonificaciones GENERATED ALWAYS AS(Volumen_Compra_Mensual * 0.05))  
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

**Productos:** (Codigo_producto, Nombre, Tipo, Unidades_Totales, Stock, Unidades_Vendidas GENERATED ALWAYS AS (Unidades_Totales - Stock)  
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

## Imagenes de los select de la base de datos

#### CLIENTE

[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/CLIENTE.PNG)

#### EMPLEADO

[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/EMPLEADO.PNG)

#### PEDIDOS

[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/PEDIDOS.PNG)

#### PEDIDO_PRODUCTO

[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/PEDIDO_PRODUCTO.PNG)

#### PRODUCTO

[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/PRODUCTOS.PNG)

#### TRABAJA_ZONA

[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/TRABAJA_ZONA.PNG)

#### VIVERO
[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/VIVERO.PNG)

#### ZONA

[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/ZONA.PNG)

#### ZONA_VIVERO
[![Viveros_ADBD](https://github.com/Hyssen/ADBD-P3/blob/main/img/ZONA_VIVERO.PNG)

