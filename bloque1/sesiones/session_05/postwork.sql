/*1. Utiliza INNER JOIN para combinar la tabla de Pedidos con la tabla de Usuarios y obtén el nombre de usuario
 y la fecha en que se realizó cada pedido.*/
 select Usuarios.nombre, Pedidos.fecha_pedido from Usuarios join Pedidos;

/*2. Utiliza LEFT JOIN para combinar la tabla de Productos con la tabla de Detalles_Pedido y obtén el nombre del producto, 
la cantidad y el precio unitario para cada detalle de pedido.*/
select Productos.nombre_producto, Detalles_Pedido.cantidad, Productos.precio 
from Productos right join Detalles_Pedido on Productos.producto_id = Detalles_Pedido.producto_id;  

/*Si un producto no tiene un detalle de pedido, muestra NULL para las columnas correspondientes.
3. Utiliza RIGHT JOIN para combinar la tabla de Pedidos con la tabla de Usuarios y obtener el nombre de usuario y la fecha de pedido para cada pedido.

Incluye todos los pedidos, incluso si no hay un usuario asociado al pedido.
4. Utiliza UNION para combinar los nombres de los productos de la tabla Productos y Detalles_Pedido, en un sólo conjunto de resultados.

5. Utiliza CROSS JOIN para generar todas las posibles combinaciones entre los nombres de usuario de la tabla Usuarios y los nombres de producto de la tabla Productos.*/