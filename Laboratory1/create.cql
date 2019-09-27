CREATE KEYSPACE ticheter
WITH replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 1
};


CREATE TYPE ticheter."goods_type"(
	name text,
	model text
);

CREATE TABLE ticheter."Characteristic"(
	charac_colour text,
	charac_price float,
	charac_availability boolean,
	charac_counter int,
	PRIMARY KEY(charac_availability)
);

CREATE TABLE ticheter."Goods"(
	id_goods int,
	name_goods FROZEN<goods_type>,
	PRIMARY KEY(id_goods)
);

CREATE TABLE ticheter."Store"(
	id_store int,
	name_store text,
	link_store text static,
	PRIMARY KEY(id_store, name_store)
);

CREATE TABLE ticheter."Result_of_searching"(
	result map<text, FROZEN <set<text>>>,
	result_name_goods FROZEN<goods_type>,
	PRIMARY KEY(result_name_goods)
);


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



