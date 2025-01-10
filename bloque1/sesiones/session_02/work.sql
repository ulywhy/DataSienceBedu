#use tienda;
# 1. Calcular la suma total de los subtotales de todos los pedidos
select sum(total_pedido) from Pedidos;
# 2. Número total de productos vendidos
select producto_id as id, count(*) as unidades_vendidas from Detalles_Pedido group by producto_id;
# Consulta 3: Número total de productos vendidos.
select count(*) from pedidos;
# 4. Número de pedidos del usuario 10
select count(*) from Pedidos where user_id = 10;
# 5. Precio máximo de pedidos hechos el 29 de mayo de 2023.
select max(total_pedido) from Pedidos where fecha_pedido = "2023-05-29";

/*
Consulta 1:
Obtén el subtotal promedio por pedido.*/
select avg(total_pedido) from Pedidos;

/*
Consulta 2:
Obtén la cantidad máxima y mínima de pedidos de un producto.*/
select max(total_pedido) high, min(total_pedido) low from Pedidos;

/*
Consulta 3:
Obtén el número de usuarios registrados por año*/
select year(fecha_registro) as year, count(*) as total from Usuarios group by year(fecha_registro);

/*
Consulta 4:
Obtén la cantidad de pedidos realizados por mes*/
select month(fecha_pedido) as month, count(*) as pedidos from Pedidos group By month(fecha_pedido);



/*
Consulta 1:
Pedidos donde el subtotal promedio sea mayor a 400.*/
select pedido_id, avg(subtotal) as average from Detalles_Pedido group by (pedido_id) having average > 400;

/*
Consulta 2:
Productos donde la cantidad máxima y mínima de pedidos sea distinta.*/
select producto_id from Detalles_Pedido group by producto_id having min(cantidad) <> max(cantidad);

# 1. Años donde el número de usuarios registrados sea igual o mayor a 1000
select count(*) as total_users, year(fecha_registro) reg_year  
	from Usuarios 
    group by reg_year
    having total_users > 1000;
# 2. Meses donde la cantidad de pedidos realizados es menor a 800
select count(*) as orders, month(fecha_pedido) as ordered_at
	from Pedidos
    group by ordered_at
    having orders < 800;