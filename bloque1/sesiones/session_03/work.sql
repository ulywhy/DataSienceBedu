/*Consulta:
Escribe una subconsulta que muestre el nombre de cada producto junto con su precio unitario 
	y la cantidad total vendida de ese producto en todos los pedidos.

Algunos tipos para hacer la consulta:

Tu subconsulta deberá calcular la cantidad total vendida de cada producto sumando todas las cantidades vendidas en los detalles de los pedidos correspondientes al producto en la fila actual de la tabla Productos.

Tu subconsulta puede incluir una condición WHERE dentro de la subconsulta asegure que sólo se sumen las cantidades vendidas del producto correspondiente al producto en la fila actual de la tabla Productos.

Muestra el resultado de la subconsulta, es decir, la cantidad total venida de cada producto, como una columna llamada cantidad_total_vendida o algo similar junto con el nombre y el precio unitario del producto en la consulta principal.
*/

select nombre_producto, precio, 
	(select sum(cantidad) from Detalles_Pedido where producto_id = Productos.producto_id) as unidades_vendidas
 from Productos where exists (select * from Detalles_Pedido where producto_id = Productos.producto_id);
 
 select 
	(select nombre_producto from Productos where producto_id = Detalles_Pedido.producto_id) as nombre,
    (select precio from Productos where producto_id = Detalles_Pedido.producto_id) as precio,
    sum(cantidad) as unidades_vendidas
 from Detalles_Pedido group by producto_id;
 
 /*
Hint: FROM
Usando subconsultas dentro de la cláusula FROM,
obten aquellas fechas donde la cantidad de pedidos haya sido mayor a 3
*/

SELECT 
    fecha_pedido
FROM
    (SELECT 
        fecha_pedido, COUNT(*) AS no_pedidos
    FROM
        Pedidos
    GROUP BY fecha_pedido) AS Conteo_Pedidos
WHERE
    no_pedidos > 3;  
    
    /*
 WHERE:
 
 Escribe una consulta que obtenga el nombre de los productos que hayan
 registrado compras con una cantidad de más de 5 unidades.
*/
select nombre_producto from Productos where producto_id in
(select producto_id from
(select producto_id, sum(cantidad) as cantidad from Detalles_Pedido group by producto_id) Producto_Cantidad
where producto_id = Producto_Cantidad.producto_id);
