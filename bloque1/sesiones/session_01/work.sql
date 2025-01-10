# SESSION 1

## RETO 1

/*
Usando la base de datos tienda, muestra la descripción de las tablas Pedidos, Productos y Detalles_Pedido.
*/
use tienda;

show tables;
/*
|---------------|
|    TABLE NAME    |
|---------------|
|     Categorias_Producto    |
|    Detalles_Pedido    |
|    Pedidos    |
|    Productos    |
|    Usuarios    |*/

describe Categorias_Producto;
/*
|-----------|-----------|
|    FIELD    |    TYPE    |
|-----------|-----------|
|    categoria_id    |    int    |
|    nombre_categotia    | varchar(50)    |*/

describe Detalles_Pedido;
/*
|-----------|-----------|
|    FIELD    |    TYPE    |
|-----------|-----------|
|    detalle_id    |    int    |
|    pedido_id    |    int    |
|    producto_id    |    int    |
|    cantidad    |    int    |
|    precio_unitario    |    decimal(10,2)    |
|    subtotal    |    decimal(10,2)    |*/

describe Pedidos;
/*
|-----------|-----------|
|    FIELD    |    TYPE    |
|-----------|-----------|
|    pedido_id    |    int    |
|    unser_id    |    int    |
|    fecha_pedido    |    date    |
|    total_pedido    |    decimal(10,2)    |*/

describe Productos;
/*
|-----------|-----------|
|    FIELD    |    TYPE    |
|-----------|-----------|
|    producto_id    |    int    |
|    nombre_producto    |    varchar(100)    |
|    descripcion    |    text    |
|    precio    |    decimal(10,2)    |
|    stock_disponible    |    int    |*/

describe Usuarios;
/*
|-----------|-----------|
|    FIELD    |    TYPE    |
|-----------|-----------|
|    user_id    |    int    |
|    nombre    |    varchar(50)    |
|    apellido    |    varchar(50)    |
|    edad    |    int    |
|    correo_electronico    |    varchar(100)    |
|    fecha_registro    |    date    |*/

## RETO 2

/*
El reto consiste en escribir consultas SQL utilizando el operador * para seleccionar todos los campos de ambas tablas por separado.
*/
/*Consulta 1:
Selecciona todos los campos de la tabla Productos.
*/

select * from Productos;

/*
Consulta 2:
Selecciona todos los campos de la tabla Pedidos.
*/

select * from Pedidos;

## RETO 3

/*
El ejercicio consiste en escribir consultas SQL utilizando la cláusula WHERE así como los operadores relacionales y lógicos.

Consulta 1:
Obten todos los pedidos realizados dentro del año 2024.
*/

select * from Pedidos where fecha_pedido between DATE('2024-01-01') and DATE('2024-12-31');

/*
Consulta 2:
Selecciona todos los usuarios cuya edad esté en los veintes.
*/

select * from Usuarios where edad between 20 and 29;

/*
Consulta 3: Selecciona todos los usuarios cuyo registro no haya sido durante el año 2020. No puedes usar el operador !=.
*/

select * from Usuarios where year(fecha_registro) <> 2020; 

/*
Consulta 4: Selecciona todos todos los pedidos realizados dentro del año 2023 o aquellos cuyo total_pedido sea mayor a 1000.
*/

select * from Pedidos where year(fecha_pedido) = 2023 or total_pedido > 1000;

/*
Consulta 5: Usando la documentación de MySQL selecciona todos los usuarios cuya edad sea mayor o igual a 18 años 
	y cuya fecha de registro sea en octubre de cualquier año. (Este tiene una complejidad mayor,
    no te estreses si no te sale a la primera 😉).
*/

select * from Usuarios where edad >= 18 and month(fecha_registro) = 10;


## RETO 4

/*
Consulta:
Obtener una lista de detalles de pedidos ordenados por el identificador del pedido de forma ascendente, 
	la cantidad de productos en el pedido de forma descendente y, 
    para aquellos detalles de pedidos con la misma cantidad, ordenarlos por su precio unitario de forma ascendente.
*/

select * from Detalles_Pedido order by cantidad desc, detalle_id asc, precio_unitario asc;