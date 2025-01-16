#!/bin/bash

### CUSTOMERS
echo "insert into Customer (gender, age, preferred_payment_method, frequency_of_purchases, location) values " >  insertCustomers.sql;

###PURCHASES
echo "insert into Purchase (customer, item, item_color, item_size, review_rating, amount, discount_applied, promocode_used, previous_purchases, payment_method, season, shipping_type) values " > insertPurchases.sql

while IFS="," read -r customerId age gender cloth category amount location size color season rating subscriptionStatus paymentMethod shippingType discountApplied promoCodeUsed previousPurchases preferredPaymentMethod frequencyOfPurchases
do

### CUSTOMERS
   echo "((select id from Gender where label = \"$gender\"), $age, (select id from PaymentMethod where name = \"$preferredPaymentMethod\"), (select id from Frenquency where name = \"${frequencyOfPurchases%?}\"), (select id  from State where name = \"$location\")), " >> insertCustomers.sql

### PURCHASES

   echo "($customerId, (select id from Cloth where name = \"$cloth\"), (select id from Color where name = \"$color\"), (select id from Size where size = \"$size\"), \"$rating\", $amount, $discountApplied, $promoCodeUsed, $previousPurchases, (select id from PaymentMethod where name = \"$paymentMethod\"), (select id from Season where name = \"$season\"), (select id from ShippingType where name = \"$shippingType\") ), "  >> insertPurchases.sql;

done < <(tail -n +2 shopping_trends.csv)

