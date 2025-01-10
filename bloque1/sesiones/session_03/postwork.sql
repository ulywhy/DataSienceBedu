/*1. Consulta 1: Usuarios Mayores de Edad
a) Escribe una consulta para seleccionar el nombre y apellido de los usuarios que tienen más de 18 años.*/
select nombre, apellido from Usuarios where edad >= 18;

/*2. Consulta 2: Pedidos de Productos Agotados
a) Escribe una consulta para seleccionar el ID y la fecha de los pedidos que contienen productos actualmente agotados en el inventario.*/
select pedido_id, (select fecha_pedido from Pedidos where pedido_id = Detalles_Pedido.pedido_id) as fechaPedido 
from Detalles_Pedido 
where producto_id in (select producto_id from Productos where stock_disponible = 0);

/*3. Consulta 3: Cantidad Total de Pedidos por Usuario
a) Escribe una consulta para mostrar el nombre del usuario y la cantidad total de pedidos realizados por cada usuario.*/
select (select nombre from Usuarios where user_id= Pedidos.user_id) as usuario, count(*) as total from Pedidos group by user_id;

/*4. Consulta 4: Productos con Precio Superior al Promedio
a) Escribe una consulta para seleccionar el nombre del producto 
y su precio para todos los productos cuyo precio sea superior al precio promedio de todos los productos.*/
select nombre_producto from Productos where precio > (select avg(precio) from Productos);

/*5. Consulta 5: Productos con Precio Superior al Promedio Versión 2
a) Añade a la consulta anterior el precio promedio como columna para poder comparar los resultados.*/
select nombre_producto, precio, (select avg(precio) from Productos)as promedio from Productos where precio > (select avg(precio) from Productos);
