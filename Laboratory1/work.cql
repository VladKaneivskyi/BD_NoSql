INSERT INTO ticheter."Goods_Result_Store_Characteristic"(charac_colour, charac_price, charac_availability,charac_counter, id_goods, name_goods, name_store, link_store,id_store, result)
VALUES ('black',1099,true,15, 1,{"name": 'IPhone XR', "model": 'Apple'},'Rozetka', 'https://rozetka.com.ua/ua/', 0,{'are available': {'Rozetka'}});
INSERT INTO ticheter."Goods_Result_Store_Characteristic"(charac_colour, charac_price, charac_availability,charac_counter, id_goods, name_goods, name_store, link_store,id_store, result)
VALUES ('white',599,false,0, 2,{"name": 'Mate 30 PRO', "model": 'Huawei'}, 'Comfy', 'https://comfy.ua', 2, {'not available': {}} );
INSERT INTO ticheter."Goods_Result_Store_Characteristic"(charac_colour, charac_price, charac_availability,charac_counter, id_goods, name_goods, name_store, link_store,id_store, result)
VALUES ('red',2000,true,5, 0, {"name": 'S10', "model": 'Samsung'}, 'Rozetka', 'https://rozetka.com.ua/ua/', 0,{'are available': {'Rozetka','Comfy','Citrus'}} );

SELECT * FROM ticheter."Goods_Result_Store_Characteristic";

CREATE INDEX names on ticheter."Goods_Result_Store_Characteristic" (name_goods);
CREATE INDEX goooods on ticheter."Goods_Result_Store_Characteristic" (result);
CREATE INDEX result on ticheter."Goods_Result_Store_Characteristic" (result_name_goods);
CREATE INDEX prices on ticheter."Goods_Result_Store_Characteristic" (charac_price);
CREATE INDEX names_s on ticheter."Goods_Result_Store_Characteristic" (name_store);

UPDATE ticheter."Goods_Result_Store_Characteristic"
SET 
  name_goods={
          name: 'IPhone11',
          model: 'Apple'
        }
WHERE id_goods = 1 and charac_availability= true and id_store= 0 ;
SELECT * FROM ticheter."Goods_Result_Store_Characteristic";

UPDATE ticheter."Goods_Result_Store_Characteristic"
SET 
  charac_colour='green'
WHERE id_goods = 0 and charac_availability= true and id_store= 0;
SELECT * FROM ticheter."Goods_Result_Store_Characteristic";

UPDATE ticheter."Goods_Result_Store_Characteristic"
SET 
  link_store='https://rozeeeeetkkaaaa.com',
  charac_colour = 'yellow'
WHERE id_goods = 0 and charac_availability= true and id_store= 0;
SELECT * FROM ticheter."Goods_Result_Store_Characteristic";





DELETE name_store FROM ticheter."Goods_Result_Store_Characteristic"
WHERE  id_goods = 0 and id_store= 0 and charac_availability= true ;
SELECT * FROM ticheter."Goods_Result_Store_Characteristic";

DELETE name_store FROM ticheter."Goods_Result_Store_Characteristic"
WHERE  id_goods = 1 and id_store= 0 and  charac_availability= true;
SELECT * FROM ticheter."Goods_Result_Store_Characteristic";

DELETE name_store FROM ticheter."Goods_Result_Store_Characteristic"
WHERE  id_goods = 2 and id_store= 2 and charac_availability= false;
SELECT * FROM ticheter."Goods_Result_Store_Characteristic";




SELECT id_goods, result
FROM ticheter."Goods_Result_Store_Characteristic"
WHERE name_goods={"name": 'S10', "model": 'Samsung'};


SELECT *
FROM ticheter."Goods_Result_Store_Characteristic" 
WHERE charac_price=2000;



SELECT name_goods,link_store
FROM ticheter."Goods_Result_Store_Characteristic" 
WHERE name_store='Rozetka';

SELECT name_goods,link_store
FROM ticheter."Goods_Result_Store_Characteristic" 
WHERE name_store='Comfy' and id_goods=2;
