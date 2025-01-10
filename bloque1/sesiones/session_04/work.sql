#RETO 1
/*Supongamos que necesitamos realizar un análisis de los productos comprados por cada usuario.
 Para ello, debemos combinar información de las tablas Usuarios, Pedidos, Detalle_Pedido y Productos.

Identifica qué columnas necesitas incluir en tu consulta para obtener la información requerida.

Utiliza la cláusula INNER JOIN para combinar las tablas Usuarios, Pedidos, Detalles_Pedido y Productos basándote en las columnas adecuadas.

Especifica las condiciones de coincidencia utilizando la cláusula ON.

Selecciona las columnas necesarias para tu análisis y ejecuta la consulta.*/

select Usuarios.nombre as usuario, Pedidos.pedido_id, Pedidos.fecha_pedido, Pedidos.total_pedido, 
Detalles_Pedido.cantidad, Productos.nombre_producto as producto, Productos.precio from Detalles_Pedido inner join Pedidos
on Detalles_Pedido.pedido_id = Pedidos.pedido_id
inner join Productos
on Detalles_Pedido.producto_id = Productos.producto_id
inner join Usuarios 
on Pedidos.user_id = Usuarios.user_id order by usuario asc, pedido_id desc, producto asc;

#RETO 2
/*Ejercicio: LEFT JOIN para combinar usuarios, pedidos y detalles de pedidos

Utiliza LEFT JOIN para combinar las tablas Usuarios, Pedidos y Detalles_Pedido, de manera que obtengas 
todos los registros de la tabla Usuarios y los registros coincidentes de las tablas Pedidos y Detalles_Pedido, si las hay.

Selecciona las columnas necesarias para obtener información sobre los usuarios, los pedidos y los detalles de los pedidos, 
como el nombre del usuario, la fecha del pedido, el nombre del producto y la cantidad comprada.
*/
select Usuarios.nombre as usuario, Pedidos.pedido_id, Pedidos.fecha_pedido, Pedidos.total_pedido, 
Detalles_Pedido.cantidad, Productos.nombre_producto as producto, Productos.precio 
from Usuarios 
left join Pedidos
on Usuarios.user_id = Pedidos.user_id
left join Detalles_Pedido
on Detalles_Pedido.pedido_id = Pedidos.pedido_id
left join Productos
on Detalles_Pedido.producto_id = Productos.producto_id
order by usuario asc, pedido_id desc, producto asc;

/*Utiliza GROUP BY para agrupar los resultados por usuario y fecha del pedido, 
y calcular el total de productos comprados por cada usuario en cada fecha.*/
select Usuarios.nombre as usuario, Pedidos.fecha_pedido, SUM(Pedidos.total_pedido) totalPagado, 
SUM(Detalles_Pedido.cantidad) totalProductos
from Detalles_Pedido 
left join Pedidos
on Detalles_Pedido.pedido_id = Pedidos.pedido_id
left join Usuarios
on Usuarios.user_id = Pedidos.user_id 
#left join Productos
#on Detalles_Pedido.producto_id = Productos.producto_id
group by Usuarios.user_id, fecha_pedido
order by usuario asc, Pedidos.fecha_pedido desc;

/*¿Cómo prodrías resolver este ejercicio con RIGHT JOIN?*/
select Usuarios.nombre as usuario, Pedidos.fecha_pedido, SUM(Pedidos.total_pedido), 
SUM(Detalles_Pedido.cantidad) 
from Usuarios 
right join Pedidos
on Usuarios.user_id = Pedidos.user_id 
right join Detalles_Pedido
on Detalles_Pedido.pedido_id = Pedidos.pedido_id
#left join Productos
#on Detalles_Pedido.producto_id = Productos.producto_id
group by Usuarios.user_id, fecha_pedido
order by usuario asc, Pedidos.fecha_pedido desc;

#RETO 3
/*Ahora queremos saber cuáles productos han presentado poca venta. Para hacer esto podemos usar dos criterios:

Los que casi no se han vendido (su stock es mayor a 50).
Los que han tenido menos de 5 ventas en los pedidos.
Usa UNION para combinar ambos criterios, luego usa UNION ALL ¿Cuál es la diferencia? ¿Cuál permite resolver este reto de forma correcta?*/
select * from 
(select Productos.nombre_producto, sum(Detalles_Pedido.cantidad) as cantidadVendida,  Productos.stock_disponible as stock 
from Productos inner join Detalles_Pedido on Productos.producto_id = Detalles_Pedido.producto_id 
group by Detalles_Pedido.producto_id having cantidadVendida < 5 order by Productos.nombre_producto) MenosVendidos UNION ALL
(select Productos.nombre_producto, sum(Detalles_Pedido.cantidad) as cantidadVendida, Productos.stock_disponible as stock
from Productos inner join Detalles_Pedido on Productos.producto_id = Detalles_Pedido.producto_id
where Productos.stock_disponible > 50 group by Detalles_Pedido.producto_id order by Productos.nombre_producto) 
order by cantidadVendida desc;