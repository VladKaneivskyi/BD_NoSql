INSERT INTO ticheter."Goods" (id_goods, name_goods)
VALUES (0,{"name": 'S10', "model": 'Samsung'});
INSERT INTO ticheter."Goods" (id_goods, name_goods)
VALUES (1,{"name": 'IPhone XR', "model": 'Apple'});
INSERT INTO ticheter."Goods" (id_goods, name_goods)
VALUES (2,{"name": 'Mate 30 PRO', "model": 'Huawei'});

INSERT INTO ticheter."Store" (name_store, link_store, id_store)
VALUES ('Rozetka', 'https://rozetka.com.ua/ua/', 0);
INSERT INTO ticheter."Store" (name_store, link_store, id_store)
VALUES ('Citrus', 'https://www.citrus.ua', 1);
INSERT INTO ticheter."Store" (name_store, link_store, id_store)
VALUES ('Comfy', 'https://comfy.ua', 2);


INSERT INTO ticheter."Characteristic" (charac_colour, charac_price, charac_availability,charac_counter)
VALUES ('black',1099,true,15);
INSERT INTO ticheter."Characteristic" (charac_colour, charac_price, charac_availability,charac_counter)
VALUES ('white',599,false,0);
INSERT INTO ticheter."Characteristic" (charac_colour, charac_price, charac_availability,charac_counter)
VALUES ('red',2000,true,5);

INSERT INTO ticheter."Result_of_searching" (result_name_goods, result)
VALUES ({"name": 'S10', "model": 'Samsung'},{'are available': {'Rozetka','Comfy','Citrus'}});
INSERT INTO ticheter."Result_of_searching" (result_name_goods, result)
VALUES ({"name": 'IPhone XR', "model": 'Apple'},{'are available': {'Rozetka'}});
INSERT INTO ticheter."Result_of_searching" (result_name_goods, result)
VALUES ({"name": 'Mate 30 PRO', "model": 'Huawei'},{'not available': {}});

SELECT * FROM ticheter."Goods";
SELECT * FROM ticheter."Result_of_searching";
SELECT * FROM ticheter."Characteristic";
SELECT * FROM ticheter."Store";



CREATE TABLE ticheter."Goods_Characteristic"(
	charac_colour text static,
	charac_price float,
	charac_availability boolean,
	charac_counter int,
	id_goods int,
	name_goods FROZEN<goods_type>,
	PRIMARY KEY((id_goods), charac_availability)
);

CREATE TABLE ticheter."Goods_Store"(
	id_store int,
	name_store text,
	link_store text static,
	id_goods int,
	name_goods FROZEN<goods_type>,
	PRIMARY KEY((id_goods), id_store)
);

CREATE TABLE ticheter."Goods_Result_of_searching"(
	result map<text, FROZEN <set<text>>>,
	result_name_goods FROZEN<goods_type>,
	id_goods int,
	PRIMARY KEY((id_goods), result_name_goods)
);

DROP TABLE ticheter."Goods_Result_of_searching";
DROP TABLE ticheter."Goods_Store";
DROP TABLE ticheter."Goods_Characteristic";


INSERT INTO ticheter."Goods_Store"(name_store, link_store, id_store, id_goods, name_goods)
VALUES ('Rozetka', 'https://rozetka.com.ua/ua/', 0, 0, {"name": 'S10', "model": 'Samsung'} );
INSERT INTO ticheter."Goods_Store"(name_store, link_store, id_store, id_goods, name_goods)
VALUES ('Citrus', 'https://www.citrus.ua', 1, 1,{"name": 'IPhone XR', "model": 'Apple'} );
INSERT INTO ticheter."Goods_Store"(name_store, link_store, id_store, id_goods, name_goods)
VALUES ('Comfy', 'https://comfy.ua', 2, 2,{"name": 'Mate 30 PRO', "model": 'Huawei'} );

INSERT INTO ticheter."Goods_Characteristic"(charac_colour, charac_price, charac_availability,charac_counter, id_goods, name_goods)
VALUES ('black',1099,true,15, 1,{"name": 'IPhone XR', "model": 'Apple'} );
INSERT INTO ticheter."Goods_Characteristic"(charac_colour, charac_price, charac_availability,charac_counter, id_goods, name_goods)
VALUES ('white',599,false,0, 2,{"name": 'Mate 30 PRO', "model": 'Huawei'} );
INSERT INTO ticheter."Goods_Characteristic"(charac_colour, charac_price, charac_availability,charac_counter, id_goods, name_goods)
VALUES ('red',2000,true,5, 0, {"name": 'S10', "model": 'Samsung'} );

INSERT INTO ticheter."Goods_Result_of_searching"(result_name_goods, result, id_goods)
VALUES ({"name": 'IPhone XR', "model": 'Apple'},{'are available': {'Rozetka'}}, 1 );
INSERT INTO ticheter."Goods_Result_of_searching"(result_name_goods, result, id_goods)
VALUES ({"name": 'Mate 30 PRO', "model": 'Huawei'},{'not available': {}}, 2 );
INSERT INTO ticheter."Goods_Result_of_searching"(result_name_goods, result, id_goods)
VALUES ({"name": 'S10', "model": 'Samsung'},{'are available': {'Rozetka','Comfy','Citrus'}}, 0 );

SELECT * FROM ticheter."Goods_Result_of_searching";
SELECT * FROM ticheter."Goods_Characteristic";
SELECT * FROM ticheter."Goods_Store";

CREATE INDEX names on ticheter."Goods_Characteristic" (name_goods);
DROP index names;


UPDATE ticheter."Goods_Characteristic"
SET 
  name_goods={
          name: 'IPhone11',
          model: 'Apple'
        }
WHERE id_goods = 0 and charac_availability= true ;
SELECT * FROM ticheter."Goods_Characteristic";

UPDATE ticheter."Goods_Characteristic"
SET 
  charac_colour='green'
WHERE id_goods = 0 ;
SELECT * FROM ticheter."Goods_Characteristic";

UPDATE ticheter."Goods_Characteristic"
SET 
  charac_price= 1101
WHERE id_goods = 1 and charac_availability= true ;
SELECT * FROM ticheter."Goods_Characteristic";





UPDATE ticheter."Goods_Store"
SET 
  name_goods={
          name: 'S11',
          model: 'Samsung'
        }
WHERE id_goods = 0 and id_store= 0 ;
SELECT * FROM ticheter."Goods_Store";

UPDATE ticheter."Goods_Store"
SET 
  link_store='rozeeeeetkkaaaa'
  
WHERE id_goods = 0 ;
SELECT * FROM ticheter."Goods_Store";

UPDATE ticheter."Goods_Store"
SET 
  name_store= 'COMFY'
WHERE id_goods = 2 and id_store= 2 ;
SELECT * FROM ticheter."Goods_Store";




UPDATE ticheter."Goods_Result_of_searching"
SET 
  result={'not available': {'Rozetka'}}
WHERE id_goods = 1 and result_name_goods= {"name": 'IPhone XR', "model": 'Apple'} ;
SELECT * FROM ticheter."Goods_Result_of_searching";


DELETE name_store FROM ticheter."Goods_Store"
WHERE  id_goods = 2 and id_store= 2 ;
SELECT * FROM ticheter."Goods_Store";

DELETE name_store FROM ticheter."Goods_Store"
WHERE  id_goods = 0 and id_store= 1 ;
SELECT * FROM ticheter."Goods_Store";

DELETE name_store FROM ticheter."Goods_Store"
WHERE  id_goods = 2 and id_store= 1 ;
SELECT * FROM ticheter."Goods_Store";


DELETE charac_price FROM ticheter."Goods_Characteristic"
WHERE  id_goods = 0 and charac_availability= true ;
SELECT * FROM ticheter."Goods_Characteristic";

DELETE charac_price FROM ticheter."Goods_Characteristic"
WHERE  id_goods =1 and charac_availability= true ;
SELECT * FROM ticheter."Goods_Characteristic";

DELETE charac_price FROM ticheter."Goods_Characteristic"
WHERE  id_goods = 2 and charac_availability= false ;
SELECT * FROM ticheter."Goods_Characteristic";



DELETE result FROM ticheter."Goods_Result_of_searching"
WHERE id_goods = 1 and result_name_goods= {"name": 'IPhone XR', "model": 'Apple'} ;
SELECT * FROM ticheter."Goods_Result_of_searching";

DELETE result FROM ticheter."Goods_Result_of_searching"
WHERE id_goods = 0 and result_name_goods= {"name": 'Mate 30 PRO', "model": 'Huawei'} ;
SELECT * FROM ticheter."Goods_Result_of_searching";

DELETE result FROM ticheter."Goods_Result_of_searching"
WHERE id_goods = 2 and result_name_goods= {"name": 'S10', "model": 'Samsung'} ;
SELECT * FROM ticheter."Goods_Result_of_searching";

CREATE INDEX goooods on ticheter."Goods_Characteristic" (result);


SELECT id_goods, result
FROM ticheter."Goods_Result_of_searching"
WHERE result_name_goods={"name": 'S10', "model": 'Samsung'}
Allow filtering;


CREATE INDEX prices on ticheter."Goods_Characteristic" (charac_price);
DROP index prices;

SELECT *
FROM ticheter."Goods_Characteristic" 
WHERE charac_price=2000;

CREATE INDEX names_s on ticheter."Goods_Store" (name_store);

SELECT name_goods,link_store
FROM ticheter."Goods_Store" 
WHERE name_store='Rozetka';

SELECT name_goods,link_store
FROM ticheter."Goods_Store" 
WHERE name_store='Citrus' and id_goods=1;
