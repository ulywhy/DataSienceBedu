select SUM(amount), AVG(amount) from Purchase;

#¿Cual es el total de ventas por producto?

select Cloth.id, Cloth.name, sum(Purchase.amount) as total
from Purchase join Cloth on Purchase.item = Cloth.id group by Purchase.item
order by total DESC;

# ¿Que temporada tiene el producto mas/menos vendido y cúal es?

select Season.name as season, Cloth.name, sum(Purchase.amount) as total
from Purchase 
join Season on Purchase.season = Season.id 
join Cloth on Purchase.item = Cloth.id
group by  Season.name, Purchase.item
order by total DESC;