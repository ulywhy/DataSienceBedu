/*
1. Encuentra el número total de usuarios registrados cuya edad sea mayor o igual a 30 años.*/
select count(*) from Usuarios where edad >= 30;
/*
2. Lista los productos que tienen un precio mayor a $50 ordenados por nombre de producto de forma ascendente.*/
select producto_id, nombre_producto from Productos where precio > 50 order by nombre_producto asc;
/*
3. Calcula la edad promedio de usuarios por fecha de registro.*/
select fecha_registro, avg(edad) as edad_promedio from Usuarios group by fecha_registro;
/*
4. Encuentra el identificador del producto y la cantidad vendida en cada pedido,
 donde la cantidad vendida sea mayor a 10 unidades, ordenado por el identificador del producto de forma descendente.*/
select producto_id, cantidad from Detalles_Pedido where cantidad > 10 order by producto_id desc;
/*
5. Muestra los usuarios que se registraron en el último mes, ordenados por fecha de registro de forma ascendente.*/
select user_id, nombre from Usuarios where fecha_registro > date_sub(now(), interval 1 month); 