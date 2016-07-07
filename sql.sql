drop database huachengdb;
create database huachengdb;
use huachengdb;

/**
 * 客户信息
 */
create table customer(
	id 			int primary key auto_increment ,
	name 			varchar(100),
	phone			varchar(50), 
	address 		varchar(200),
	description 	varchar(500),
	UTD1 			varchar(200),
	UTD2 			varchar(200)
);
create table car(
	id 	        int primary key auto_increment ,
	cust_id 	int,
	carType 	varchar(50),
	carNum 		varchar(100),
	car_color 	varchar(50),
	mileage 	varchar(50),/** 进场里程**/
	VIN		varchar(50),/**车架识别码**/
	description     varchar(200),
	UTD1 		varchar(200),
	UTD2 		varchar(200),
	foreign key(cust_id) REFERENCES  customer(id)
);


/**
 * 配件信息
 */
create table car_parts(
	id 		int primary key auto_increment ,
	name 		varchar(100),
	type 		varchar(20),
	positions 	varchar(200),
	description     varchar(500),
	UTD1 		varchar(200),
	UTD2 		varchar(200)
);
/**
 *如数据库中已存在此类型的配件，则提示 该配件已存在，需要查询得到该配件  点击修改，
 *新增  进货记录即可
 * 
 */

/**
 * 库存管理
 */
create table parts_store(
	id 	        int primary key auto_increment ,
	car_parts_id 	int,
	parts_num 	varchar(100),/**型号**/
	increase_Date 	varchar(20),/**进货时间 **/
	num		int,/**进货总量**/
	surplus_num	int,/**剩余量**/
	unit_price 	float(9,2),/**进货单价**/
	sum_price 	float(9,2),/**此次进货的总的价格**/
	sell_unit_price float(9,2),/**所卖单价**/
	description 	varchar(200),
	UTD1 		varchar(200),
	UTD2 		varchar(200),
	FOREIGN key (car_parts_id) REFERENCES car_parts(id)
);

create table project(
	id 		int primary key auto_increment ,
	cust_id 	int,
	car_id 		int,
	projectType 	varchar(100),
	projectName 	varchar(200),
	other_price 	float(9,2),/**若换取配件加维修，则此为维修费用**/
	startDate 	varchar(20),/**服务开始时间**/
	endDate 	varchar(20),/**服务结束时间**/
	outServiceDate 	varchar(20),/**维修保质时间**/
	chargePerson	varchar(100),/**负责人**/
	status		varchar(10),/**当前项目的状态：已完成(付款成功，则认为该项目已完成)、未完成(缺件、不可完成、未付款、其他原因，可在备注中说明)**/
	isdelete 	int,/**逻辑删除标志 1 标识删除**/
	description 	varchar(200),
	UTD1 		varchar(200),
	UTD2 		varchar(200),
	FOREIGN key(cust_id) REFERENCES customer(id),
	FOREIGN key(car_id) REFERENCES car(id)
);

/**
 * 配件和服务对应表;   一种配件可以被多个服务使用，一个服务可以选择多个配件
 **/
 
create table  project_parts(
	id 				int primary key auto_increment ,
	projectId		int,                 /**对应的服务编号**/
	parts_storeId	int,                 /**对应的配件编号**/
	usedNum			int,                 /**当前服务使用的当前配件的个数**/
	isdelete		int,                 /**逻辑删除标志  **/
	UTD1		varchar(200),
	UTD2		varchar(200),
	FOREIGN key (projectId) REFERENCES project(id),
	FOREIGN key (parts_storeId) REFERENCES parts_store(id)
);




/** 缺件记录表 **/
create table lack_parts(
	id             int primary key auto_increment ,
	cust_id        int ,
	car_partsName  varchar(100),
	parts_num      varchar(100),/**型号**/
	carNum	       varchar(100),
	createDate     varchar(20),
	needNum	       int,            /**所需数量**/
	status 	       varchar(10),   /**缺件状态：已补充完成   未补充完成**/
	description    varchar(200),
	UTD1	       varchar(200),
	UTD2	       varchar(200),
	FOREIGN key(cust_id) REFERENCES customer(id)
);





/*
1. 钱是否在这上面来计算
2.点击详情：  显示：

 */