#!/bin/bash
echo "insert into Customer (gender, age, preferredPaymenytMethod, frequencyOfPurchases) values \n" >>  insertCustomers.sql;

while IFS="," read -r customerId age gender cloth category amount location size color season rating subscriptionStatus paymentMethod shippingType discountApplied promoCodeUsed previousPurchases preferredPaymentMethod frequencyOfPurchases
do
   echo "(select id from Gender where label = \"$gender\"), $age, (select id from PaymentMethod where name = \"$prefferredPaymentMethod\"), (select id from Frenquency where name = \"$frequencyOfPurchases\"),\n" >> insertCustomers.sql
done < <(tail -n +2 /home/ulywhy/Desktop/DataScienceBedu/archive/shopping_trends.csv)