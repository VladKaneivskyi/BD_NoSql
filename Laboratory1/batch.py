from cassandra.cluster import Cluster

cluster = Cluster()
connection = cluster.connect('ticheter')

batch = """
BEGIN BATCH
INSERT INTO ticheter."Goods_Result_Store_Characteristic"(charac_colour, charac_price, charac_availability,charac_counter, id_goods, name_goods, name_store, link_store,id_store, result)
VALUES ('red',2000,true,5, 0, {"name": 'S10', "model": 'Samsung'}, 'Rozetka', 'https://rozetka.com.ua/ua/', 0,{'are available': {'Rozetka','Comfy','Citrus'}} );


UPDATE ticheter."Goods_Result_Store_Characteristic"
SET 
  charac_colour='green'
WHERE id_goods = 0 and charac_availability= true and id_store= 0;

INSERT INTO ticheter."Goods_Result_Store_Characteristic"(charac_colour, charac_price, charac_availability,charac_counter, id_goods, name_goods, name_store, link_store,id_store, result)
VALUES ('black',1099,true,15, 1,{"name": 'IPhone XR', "model": 'Apple'},'Rozetka', 'https://rozetka.com.ua/ua/', 0,{'are available': {'Rozetka'}});

APPLY BATCH;
"""
connection.execute(batch)
