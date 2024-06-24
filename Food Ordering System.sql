--script to create FoS database
DROP TABLE beverage CASCADE CONSTRAINTS;
DROP TABLE food CASCADE CONSTRAINTS;
DROP TABLE feedbacks CASCADE CONSTRAINTS;
DROP TABLE payments CASCADE CONSTRAINTS;
DROP TABLE tables CASCADE CONSTRAINTS;
DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE items CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE customers CASCADE CONSTRAINTS;
DROP TABLE memberships CASCADE CONSTRAINTS;

COMMIT;

Prompt **  Creating memberships table ....

CREATE TABLE memberships (
    memberType NUMBER(1),
    discount_rate NUMBER(3,2),
    memberDesc VARCHAR2(10),
    CONSTRAINT memberships_memberType_pk PRIMARY KEY (memberType)
);

Prompt **  Creating customers table ....

CREATE TABLE customers (
    c_id NUMBER(5),
    c_first VARCHAR2(30),
    c_last VARCHAR2(30),
    c_gender VARCHAR2(1),
    c_email VARCHAR2(50),
    c_phone VARCHAR2(10),
    memberType NUMBER(1),
    CONSTRAINT customers_c_id_pk PRIMARY KEY (c_id),
    CONSTRAINT customers_memberType_fk FOREIGN KEY (memberType) REFERENCES memberships(memberType)
);

Prompt **  Creating orders table ....

CREATE TABLE orders (
    o_id  NUMBER(8),
    c_id NUMBER(5),
    o_date DATE,
    o_status VARCHAR2(10),
    CONSTRAINT orders_o_id_pk PRIMARY KEY (o_id),
    CONSTRAINT orders_c_id_fk FOREIGN KEY (c_id) REFERENCES customers(c_id)
);

Prompt **  Creating items table ....

CREATE TABLE items (
    item_id VARCHAR2(8),
    item_desc VARCHAR2(50),
    item_price NUMBER(5,2),
    item_type VARCHAR2(10),
    CONSTRAINT items_item_id_pk PRIMARY KEY (item_id)
);

Prompt **  Creating order_item table ....

CREATE TABLE order_item (
    o_id NUMBER(8),
    item_id VARCHAR2(8),
    remark VARCHAR2(50),
    CONSTRAINT order_item_o_id_fk FOREIGN KEY (o_id) REFERENCES orders(o_id),
    CONSTRAINT order_item_item_id_fk FOREIGN KEY (item_id) REFERENCES items(item_id),
    CONSTRAINT order_item_oid_itemid_pk PRIMARY KEY(o_id,item_id)
);

Prompt **  Creating tables table ....

CREATE TABLE tables (
    t_id VARCHAR2(5),
    o_id NUMBER(8),
    t_status VARCHAR2(15),
    CONSTRAINT tables_t_id_pk PRIMARY KEY (t_id),
    CONSTRAINT tables_o_id_fk FOREIGN KEY (o_id) REFERENCES orders(o_id)
);

Prompt **  Creating payments table ....

CREATE TABLE payments (
    p_id VARCHAR2(5),
    o_id NUMBER(8),
    p_amount NUMBER(5,2),
    p_method VARCHAR2(10),
    p_status VARCHAR2(20),
    CONSTRAINT payments_p_id_pk PRIMARY KEY (p_id),
    CONSTRAINT payments_o_id_fk FOREIGN KEY (o_id) REFERENCES orders(o_id)
);

Prompt **  Creating feedbacks table ....

CREATE TABLE feedbacks (
    fb_id VARCHAR2(5),
    c_id NUMBER(5),
    rating NUMBER(1),
    CONSTRAINT feedbacks_fb_id_pk PRIMARY KEY (fb_id),
    CONSTRAINT feedbacks_c_id_fk FOREIGN KEY (c_id) REFERENCES customers(c_id)
);

Prompt **  Creating food table ....

CREATE TABLE food (
item_id VARCHAR2(8),
pax VARCHAR2(5),
food_desc VARCHAR2(100),
    CONSTRAINT food_item_id_fk FOREIGN KEY (item_id) REFERENCES items(item_id),
    CONSTRAINT food_itemid_pk PRIMARY KEY(item_id)
);

Prompt **  Creating beverage table ....

CREATE TABLE beverage (
    item_id VARCHAR2(8),
    volume VARCHAR2(10),
    alcohol_percent NUMBER(4,2),
    CONSTRAINT beverage_item_id_fk FOREIGN KEY (item_id) REFERENCES items(item_id),
    CONSTRAINT beverage_itemid_pk PRIMARY KEY(item_id)
);

COMMIT;
SET VERIFY OFF;
ALTER SESSION SET NLS_LANGUAGE=American;

Prompt ******  Populating memberships table ....

--- inserting records into memberships
INSERT INTO memberships VALUES
(0, 1.00, 'Non-Member');

INSERT INTO memberships VALUES
(1, 0.90, 'Silver');

INSERT INTO memberships VALUES
(2, 0.80, 'Gold');

INSERT INTO memberships VALUES
(3, 0.70, 'Diamond');


Prompt ******  Populating customers table ....

--- inserting records into customers
INSERT INTO customers VALUES
(001, 'Miller', 'Sarah', 'F', 'miller@gmail.com', '0141237305', 0);
 
INSERT INTO customers VALUES
(002, 'Umato', 'Brian', 'M', 'umato@gmail.com', '0160952590', 2);
 
INSERT INTO customers VALUES
(003, 'Black', 'Daniel', 'M', 'black@gmail.com', '0144187549', 3);
 
INSERT INTO customers VALUES
(004, 'Mobley', 'Amanda', 'F', 'mobley@gmail.com', '0141094753', 0);
 
INSERT INTO customers VALUES
(005, 'Sanchez', 'Ruben', 'M', 'sanchez@gmail.com', '0169812579', 1);

INSERT INTO customers VALUES
(006, 'Connoly', 'Michael', 'M', 'connoly@gmail.com', '0149158104', 0);

INSERT INTO customers VALUES
(007, 'Elsa', 'William', 'F', 'elsa@gmail.com', '0125874996', 1);

INSERT INTO customers VALUES
(008, 'Micheal', 'James', 'M', 'micheal@gmail.com', '0185263948', 3);

INSERT INTO customers VALUES
(009, 'Reborn', 'Wade', 'M', 'rebornw@gmail.com', '0125364152', 2);

INSERT INTO customers VALUES
(010, 'Taylor', 'Jackson', 'F', 'taylor@gmail.com', '0131526348', 2);


Prompt ******  Populating orders table ....

--- inserting records into orders
INSERT INTO orders VALUES
(0001, 001, TO_DATE('23-May-2024', 'DD/ Mon/YYYY'), 'Served');
 
INSERT INTO orders VALUES
(0002, 002, TO_DATE('23-May-2024', 'DD/ Mon/YYYY'), 'Served');
 
INSERT INTO orders VALUES
(0003, 003, TO_DATE('23-May-2024', 'DD/ Mon/YYYY'), 'Served');
 
INSERT INTO orders VALUES
(0004, 004, TO_DATE('24-May-2024', 'DD/ Mon/YYYY'), 'Served');
 
INSERT INTO orders VALUES
(0005, 005, TO_DATE('24-May-2024', 'DD/ Mon/YYYY'), 'Served');
 
INSERT INTO orders VALUES
(0006, 006, TO_DATE('24-May-2024', 'DD/ Mon/YYYY'), 'Served');

INSERT INTO orders VALUES
(0007, 007, TO_DATE('24-May-2024', 'DD/ Mon/YYYY'), 'Served');

INSERT INTO orders VALUES
(0008, 008, TO_DATE('25-May-2024', 'DD/ Mon/YYYY'), 'Served');

INSERT INTO orders VALUES
(0009, 009, TO_DATE('25-May-2024', 'DD/ Mon/YYYY'), 'Served');

 INSERT INTO orders VALUES
(0010, 010, TO_DATE('25-May-2024', 'DD/Mon/YYYY'), 'Served');

INSERT INTO orders VALUES
(0011, 001, TO_DATE('26-May-2024', 'DD/ Mon/YYYY'), 'Served');

Prompt ******  Populating items table ....

--- inserting records into items
INSERT INTO items VALUES
('F001', 'SH Burger', 20, 'Food');
 
INSERT INTO items VALUES
('F002', 'Chicken Goreng', 11, 'Food');

INSERT INTO items VALUES
('F003', 'Golden Fries', 10, 'Food');
 
INSERT INTO items VALUES
('F004', 'SH Spagetti', 23, 'Food');

INSERT INTO items VALUES
('F005', 'Crispy Chicken Chop', 22, 'Food');

INSERT INTO items VALUES
('F006', 'Pizza In The Sky', 30, 'Food');

INSERT INTO items VALUES
('F007', 'Pop Chicken Popcorn', 15, 'Food');
 
INSERT INTO items VALUES
('B001', 'Orin Juice', 8, 'Beverage');
 
INSERT INTO items VALUES
('B002', 'Skittie Juice', 10, 'Beverage');
 
INSERT INTO items VALUES
('B003', 'Kun Mojito', 18, 'Beverage');

INSERT INTO items VALUES
('B004', 'Apollo Juice', 9, 'Beverage');

INSERT INTO items VALUES
('B005', 'Jinger Bell Juice', 10, 'Beverage');

INSERT INTO items VALUES
('B006', 'Elsa Blended', 13, 'Beverage');

INSERT INTO items VALUES
('B007', 'Henshin Cocktail', 20, 'Beverage');

Prompt ******  Populating order_item table ....

--- inserting records into order_item
INSERT INTO order_item VALUES
(0001, 'F001', 'Give me more spicy');
 
INSERT INTO order_item VALUES
(0001, 'F004', 'Change the spagetti to rice, thankyou');
 
INSERT INTO order_item VALUES
(0001, 'B001', 'Iced');	

INSERT INTO order_item VALUES
(0001, 'B007', 'Iced');

INSERT INTO order_item VALUES
(0002, 'F005', 'MORE sauce MORE sauce MORE sauce');

INSERT INTO order_item VALUES
(0002, 'B005', ' Less Ice');

INSERT INTO order_item VALUES
(0003, 'F002', NULL);

INSERT INTO order_item VALUES
(0003, 'F006', 'Regular size');

INSERT INTO order_item VALUES
(0003, 'F003', 'Dont be too burnt');

INSERT INTO order_item VALUES
(0003, 'B004', 'Normal ice, less sugar');

INSERT INTO order_item VALUES
(0003, 'B003', 'Less ice');

INSERT INTO order_item VALUES
(0004, 'F002', 'Chicken Thigh');

INSERT INTO order_item VALUES
(0004, 'F001', 'More union and lettuce');

INSERT INTO order_item VALUES
(0004, 'F004', 'Vegan');

INSERT INTO order_item VALUES
(0004, 'B001', 'Less ice');

INSERT INTO order_item VALUES
(0004, 'B005', 'Half ice, Half sugar');

INSERT INTO order_item VALUES
(0004, 'B002', 'More ice, thx');

INSERT INTO order_item VALUES
(0005, 'F002', 'Chicken Breast');

INSERT INTO order_item VALUES
(0005, 'F001', 'Ketchup and no mayo');

INSERT INTO order_item VALUES
(0005, 'B002', 'Hot');

INSERT INTO order_item VALUES
(0006, 'F001', 'More chili sauce and no vege'); 

INSERT INTO order_item VALUES
(0006, 'F004', 'No vege');

INSERT INTO order_item VALUES
(0006, 'F005', 'Only chicken chop, no side dish');

INSERT INTO order_item VALUES
(0006, 'F006', 'NO PINEAPPLE!');

INSERT INTO order_item VALUES
(0006, 'B001', 'No sugar, less ice');

INSERT INTO order_item VALUES
(0006, 'B003', 'Normal ice');

INSERT INTO order_item VALUES
(0006, 'B006', NULL);

INSERT INTO order_item VALUES
(0006, 'B007', 'More ice');

INSERT INTO order_item VALUES
(0007, 'F003', 'Put ketchup to an empty plate, thankyou');

INSERT INTO order_item VALUES
(0007, 'F007', 'Dont put chili powder');

INSERT INTO order_item VALUES
(0007, 'B001', 'No sugar, Half ice');

INSERT INTO order_item VALUES
(0007, 'B003', 'Normal ice');

INSERT INTO order_item VALUES
(0008, 'F002', 'I want Chicken Wings');

INSERT INTO order_item VALUES
(0008, 'F003', 'Put some mayo on it');

INSERT INTO order_item VALUES
(0008, 'F007', 'Give me MORE MORE MORE chili powder');

INSERT INTO order_item VALUES
(0008, 'B004', 'No ice, No sugar');

INSERT INTO order_item VALUES
(0008, 'B005', 'Half ice, No sugar');

INSERT INTO order_item VALUES
(0008, 'B007', 'Normal ice');

INSERT INTO order_item VALUES
(0009, 'F001', 'No onion and more lettuce');

INSERT INTO order_item VALUES
(0009, 'B002', 'Warm');

INSERT INTO order_item VALUES
(0010, 'F003', 'Put all the sauces you have on it');

INSERT INTO order_item VALUES
(0010, 'F004', 'No vege');

INSERT INTO order_item VALUES
(0010, 'B006', NULL);

INSERT INTO order_item VALUES
(0001, 'B003', NULL);

Prompt ******  Populating tables table ....

--- inserting records into tables
INSERT INTO tables VALUES
('T001', NULL, 'Vacant');
 
INSERT INTO tables VALUES
('T002', NULL, 'Vacant');
 
INSERT INTO tables VALUES
('T003', NULL, 'Vacant'); 

INSERT INTO tables VALUES
('T004', NULL, 'Vacant');
 
INSERT INTO tables VALUES
('T005', NULL, 'Vacant');

INSERT INTO tables VALUES
('T006', NULL, 'Vacant');

INSERT INTO tables VALUES
('T007', NULL, 'Vacant');

INSERT INTO tables VALUES
('T008', NULL, 'Vacant');

INSERT INTO tables VALUES
('T009', NULL, 'Vacant');

INSERT INTO tables VALUES
('T010', NULL, 'Vacant');

Prompt ******  Populating payments table ....

--- inserting records into payments
INSERT INTO payments VALUES
('P001', 0001,  71, 'Cash', 'Completed');

INSERT INTO payments VALUES
('P002', 0002, 32, 'Cash', 'Completed');
 
INSERT INTO payments VALUES
('P003', 0003, 78, 'Card', 'Completed');

INSERT INTO payments VALUES
('P004', 0004, 82, 'Card', 'Completed');

INSERT INTO payments VALUES
('P005', 0005, 41, 'Cash', 'Completed');

INSERT INTO payments VALUES
('P006', 0006, 154, 'Card', 'Completed');

INSERT INTO payments VALUES
('P007', 0007, 51, 'Cash', 'Completed');

 INSERT INTO payments VALUES
('P008', 0008, 75, 'Card', 'Completed');

INSERT INTO payments VALUES
('P009', 0009, 30, 'Cash', 'Completed');

INSERT INTO payments VALUES
('P010', 0010, 46, 'Cash', 'Completed');

INSERT INTO payments VALUES
('P011', 0011,  18, 'Cash', 'Completed');

Prompt ******  Populating feedbacks table ....

--- inserting records into feedbacks
INSERT INTO feedbacks VALUES
('FB001', 001, 4);

INSERT INTO feedbacks VALUES
('FB002', 002, 3);

INSERT INTO feedbacks VALUES
('FB003', 003, 5);

INSERT INTO feedbacks VALUES
('FB004', 004, 5);

INSERT INTO feedbacks VALUES
('FB005', 005, 4);

INSERT INTO feedbacks VALUES
('FB006', 006, 2);

INSERT INTO feedbacks VALUES
('FB007', 007, 3);

INSERT INTO feedbacks VALUES
('FB008', 008, 5);

INSERT INTO feedbacks VALUES
('FB009', 009, 5);

INSERT INTO feedbacks VALUES
('FB010', 010, 5);

Prompt ******  Populating food table ....

--- inserting records into food
INSERT INTO food VALUES
('F001', '1', 'Fried Chicken Patty, Cheese, Mayonnaise, Lettuce, Onion, Cucumber, Scrambled Egg');
 
INSERT INTO food VALUES
('F002', '1-2', 'Chicken Thigh, Chicken Wings, Chicken Breast');

INSERT INTO food VALUES
('F003', '2-3', 'Potatoes, Parsley Leaves, Black pepper Powder, Chili Powder');
 
INSERT INTO food VALUES
('F004', '1', 'Carbonara Sauce, Diced Bacon, Parmesan Cheese, Garlic, Eggs');

INSERT INTO food VALUES
('F005', '1-2', 'Chicken Thigh, French Fries, Coleslaw, Parsley Leave, Black Pepper Sauce, Mushroom, Barbeque)');

INSERT INTO food VALUES
('F006', '6-8', 'Pineapples, Mozzarella Cheese, Pepperoni, Thousand Island Sauce, Mushrooms');

INSERT INTO food VALUES
('F007', '2-3', 'Chicken Breast, Black Pepper Powder, Chili Powder');
 

Prompt ******  Populating beverage table ....

--- inserting records into beverage
INSERT INTO beverage VALUES
('B001', '8oz', 00.00 );
 
INSERT INTO beverage VALUES
('B002', '10oz', 00.00);
 
INSERT INTO beverage VALUES
('B003', '10oz', 22.50);

INSERT INTO beverage VALUES
('B004', '8oz', 00.00);

INSERT INTO beverage VALUES
('B005', '8oz', 00.00);

INSERT INTO beverage VALUES
('B006', '16oz', 00.00);

INSERT INTO beverage VALUES
('B007', '6oz', 16.50);

COMMIT;

