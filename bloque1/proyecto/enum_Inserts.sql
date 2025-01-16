use shoppingTrends;

insert into Gender (label) values
("MALE"), ("FEMALE");

insert into Size (size) values
("L"),
("M"),
("S"),
("XL");

insert into Color (name) values
   ("Peach"),
   ("Pink"),
   ("Beige"),
   ("Purple"),
   ("Charcoal"),
   ("Indigo"),
   ("Yellow"),
   ("Gold"),
   ("Black"),
   ("Violet"),
   ("Silver"),
   ("Blue"),
   ("Cyan"),
   ("Brown"),
   ("Red"),
   ("White"),
   ("Olive"),
   ("Lavender"),
   ("Green"),
   ("Magenta"),
   ("Maroon"),
   ("Teal"),
   ("Orange"),
   ("Gray"),
   ("Turquoise");

   insert into PaymentMethod (name) values
   ("Cash"),
   ("Credit Card"),
   ("Venmo"),
   ("Bank Transfer"),
   ("PayPal"),
   ("Debit Card");

   insert into Frenquency (name) values
   ("Bi-Weekly"),
   ("Fortnightly"),
   ("Quarterly"),
   ("Every 3 Months"),
   ("Weekly"),
   ("Monthly"),
   ("Annually");

   insert into Season (name) values
    ("Winter"),
    ("Fall"),
    ("Spring"),
    ("Summer");

   insert into ShippingType (name) values
   ("Free Shipping"),
   ("Standard"),
   ("Store Pickup"),
   ("Next Day Air"),
   ("Express"),
   ("2-Day Shipping");
  

   insert into State (name) values 
   ("Texas"),
   ("Tennessee"),
   ("New Hampshire"),
   ("Mississippi"),
   ("Massachusetts"),
   ("Connecticut"),
   ("Pennsylvania"),
   ("Colorado"),
   ("Missouri"),
   ("Florida"),
   ("Hawaii"),
   ("Indiana"),
   ("Delaware"),
   ("Illinois"),
   ("Maryland"),
   ("Idaho"),
   ("Utah"),
   ("Ohio"),
   ("Kansas"),
   ("South Carolina"),
   ("Arizona"),
   ("New Mexico"),
   ("Nebraska"),
   ("South Dakota"),
   ("New Jersey"),
   ("Alaska"),
   ("Georgia"),
   ("Maine"),
   ("Oregon"),
   ("Alabama"),
   ("Louisiana"),
   ("Minnesota"),
   ("Nevada"),
   ("Washington"),
   ("Oklahoma"),
   ("Michigan"),
   ("Rhode Island"),
   ("New York"),
   ("Arkansas"),
   ("Vermont"),
   ("California"),
   ("North Dakota"),
   ("Iowa"),
   ("North Carolina"),
   ("Montana"),
   ("Virginia"),
   ("Kentucky"),
   ("West Virginia"),
   ("Wyoming"),
   ("Wisconsin");


    insert into Cloth (name, category) values
   ("Hoodie", (select id from Category where name ="Clothing")),
   ("Pants", (select id from Category where name ="Clothing")),
   ("Shirt", (select id from Category where name ="Clothing")),
   ("T-shirt", (select id from Category where name ="Clothing")),
   ("Dress", (select id from Category where name ="Clothing")),
   ("Skirt", (select id from Category where name ="Clothing")),
   ("Socks", (select id from Category where name ="Clothing")),
   ("Blouse", (select id from Category where name ="Clothing")),
   ("Sweater", (select id from Category where name ="Clothing")),
   ("Jeans", (select id from Category where name ="Clothing")),
   ("Shorts", (select id from Category where name ="Clothing"));

   insert into Cloth (name, category) values 
   ("Sandals", (select id from Category where name = "Footwear")),
   ("Sneakers", (select id from Category where name = "Footwear")),
   ("Boots", (select id from Category where name = "Footwear")),
   ("Shoes", (select id from Category where name = "Footwear"));

insert into Cloth (name, category) values 
   ("Belt", (select id from Category where name = "Accessories")),
   ("Jewelry", (select id from Category where name = "Accessories")),
   ("Hat", (select id from Category where name = "Accessories")),
   ("Scarf", (select id from Category where name = "Accessories")),
   ("Gloves", (select id from Category where name = "Accessories")),
   ("Backpack", (select id from Category where name = "Accessories")),
   ("Handbag", (select id from Category where name = "Accessories")),
   ("Sunglasses", (select id from Category where name = "Accessories"));

insert into Cloth (name, category) values 
   ("Jacket", (select id from Category where name = "Outerwear")),
   ("Coat", (select id from Category where name = "Outerwear"));

