/**Escribe las siguientes consultas SQL para obtener información de la base de datos tienda, que estuviste utilizando durante la sesión en vivo.*/

#use tienda;

/*
1. Usuarios Jóvenes Registrados Recientemente:

Selecciona el nombre y apellido de los usuarios que tienen menos de 30 años y se registraron después del 1 de enero de 2020.
Ordena los resultados por fecha de registro en orden descendente.*/

select nombre, apellido from Usuarios where edad < 30 and fecha_registro > 1/1/2020; 

/*2. Productos Económicos y con Stock Disponible:

Obtén el nombre y precio de los productos que tienen un stock disponible mayor o igual a 10 y cuyo precio sea menor o igual a $50.
Ordena los resultados por precio en orden ascendente.*/

select nombre_producto nombre, precio from Productos where stock_disponible >= 10 and precio <= 50;

/*3. Pedidos Grandes Realizados Antes de una Fecha Específica:

Recupera el identificador del pedido, fecha del pedido y total del pedido para aquellos pedidos realizados antes del 1 de enero de 2024 y cuyo total del pedido sea mayor a $100.
Ordena los resultados por fecha del pedido en orden descendente.*/

select pedido_id, fecha_pedido, total_pedido from Pedidos where fecha_pedido < 1/172024 and total_pedido > 100 order by fecha_pedido desc;

/*4. Categorías de Productos Electrónicos:

Muestra la descripción del producto y el stock disponible de aquellos productos que tengan menos de 10 piezas disponibles en stock.
Ordena alfabéticamente los resultados.*/

select descripcion, stock_disponible from Productos where stock_disponible < 10 order by nombre_producto asc; 

/*5. Usuarios con Correo Electrónico en Gmail y Pedidos Recientes:

Obtén los correos electrónicos de los usuarios que son parte de la Tercera Edad y se hayan registrado en el último mes de información.
Ordena alfabéticamente los resultados por dirección de correo electrónico.*/

select correo_electronico from Usuarios where edad >= 60 and fecha_registro >= (select max(fecha_registro) from Usuarios) - 31 order by correo_electronico asc;
