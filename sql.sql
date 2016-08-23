drop database huachengdb;
create database huachengdb;
use huachengdb;

/**
 * 客户信息
 */
create table customer(
	id 				int primary key auto_increment ,
	name 			varchar(100),
	phone			varchar(50), 
	address 		varchar(200),
	description 	varchar(500),
	createDate		datetime,		/**新增时间**/
	isDelete		varchar(2), /** 1标识已删除 **/
	UTD1 			varchar(200),
	UTD2 			varchar(200)
);
create table car(
	id 	        int primary key auto_increment ,
	cust_id 	int not null,
	carType 	varchar(50),
	carNum 		varchar(100),
	createDate	datetime,
	car_color 	varchar(50),
	VIN			varchar(50),/**车架识别码**/
	description varchar(200),
	isDelete	varchar(2),	/** 1标识已删除 **/
	UTD1 		varchar(200),
	UTD2 		varchar(200),
	foreign key(cust_id) REFERENCES  customer(id)
);


/**
 * 配件信息  如数据库中已存在此类型的配件，则提示 该配件已存在，需要查询得到该配件  点击修改，新增  进货记录即可
 */
create table car_parts(
	id 			int primary key auto_increment ,
	name 		varchar(100),
	type 		varchar(20),/* 类型：  比如 ，轮子　　型号则存放： 前轮  201 等：*/
	partsNo 	varchar(100),/* 型号 */
	positions 	varchar(200),/* 位置 */
	description varchar(500),
	isDelete	varchar(2),	/** 1标识已删除 **/
	UTD1 		varchar(200),
	UTD2 		varchar(200)
);

/**
 * 库存管理
 */
create table parts_store(
	id 	        	int primary key auto_increment,
	car_parts_id 	int,
	increase_Date 	datetime,/**进货时间 **/
	num				int,/**进货总量**/
	unit_price 		float(9,2),/*进货单价*/
	sell_unit_price float(9,2),/* 销售单价 选填 */
	description 	varchar(200),
	isDelete		varchar(2),
	UTD1 			varchar(200),
	UTD2 			varchar(200),
	FOREIGN key (car_parts_id) REFERENCES car_parts(id)
);

create table project(
	id 				int primary key auto_increment ,
	cust_id 		int,
	car_id 			int,
	projectNo		varchar(100),/*单号： 日期+ 当前的单子序号(第几个单子)：*/
	projectType 	varchar(100),
	projectName 	varchar(200),
	mileage 		varchar(50),/** 进场里程**/
	parts_charge	float(9,2),/** 配件总价格 **/
	labor_charge 	float(9,2),/**若换取配件加维修，则此为维修费用 即：工时费**/
	startDate 		datetime,/**服务开始时间**/
	endDate 		datetime,/**服务结束时间**/
	outServiceDate 	datetime,/**维修保质时间**/
	chargePerson	varchar(100),/**负责人**/
	status			varchar(10),/*当前项目的状态：已完成(付款成功，则认为该项目已完成)、未完成(缺件、不可完成、未付款、其他原因，可在备注中说明)*/
	isdelete 		varchar(2),/**逻辑删除标志 1 标识删除**/
	description 	varchar(200),
	UTD1 			varchar(200),
	UTD2 			varchar(200),
	FOREIGN key(cust_id) REFERENCES customer(id),
	FOREIGN key(car_id) REFERENCES car(id)
);

/**
 * 配件和服务对应表 一种配件可以被多个服务使用，一个服务可以选择多个配件
 **/
 
create table  project_parts(
	id 				int primary key auto_increment ,
	projectId		int,                 /**对应的服务编号**/
	car_partStoreId	int,				/**对应的配件编号**/
	partsName		varchar(100),		/**冗余字段**/
	partsType 		varchar(20),		/**冗余字段**/
	partsNo 		varchar(100),		/**冗余字段**/
	usedNum			int,                /**当前服务使用的当前配件的个数**/
	isdelete		varchar(2),          /**逻辑删除标志  **/
	UTD1			varchar(200),
	UTD2			varchar(200),
	FOREIGN key (projectId) REFERENCES project(id),
/*	FOREIGN key (car_partsId) REFERENCES car_parts(id) */
	FOREIGN key (car_partStoreId) REFERENCES parts_store(id)
);




/** 缺件记录表 **/
create table lack_parts(
	id             int primary key auto_increment ,
	customerName   varchar(100),
	phone		   varchar(50), 
	partsName  	   varchar(100),
	parts_num      varchar(100),/**型号**/
	carNum	       varchar(100),
	createDate     datetime,
	finishDate	   datetime,
	needNum	       int,            /**所需数量**/
	status 	       varchar(2),   /*缺件状态：已补充完成   未补充完成 */
	description    varchar(200),
	isDelete	   varchar(2),
	UTD1	       varchar(200),
	UTD2	       varchar(200),
);





/*
1. 钱是否在这上面来计算 ，如是，则需要精确填数据，增加销售管理模块

2.配件记录： 是粗略记录 还是

3.  配件库存管理：   是否需要 对每次进货进行管理分类：
		第一次进货：  100 件	进货价：100元/件  销售价：200元/件  	卖了90件   剩余10件
		第二次进货：  100 件	进货价：130元/件  销售价：400元/件		共110件    是否分类卖，还是统一价：
		
4. 算钱：
	每次进货，默认 上次库存已用完，
	
5. 单号（日期 + 号码）

6. 如没有结算，则没有结束时间：   即 该单子 没有 接钱：

7. 维修过程中，发现其他部件发现又有问题：  增项：

8.缺件表  不打印

9. 其他费用  修改为  工时费：  



	
进场里程：  应放在 服务管理内部：  里程在变：

	计算剩余量：
	select s.id,s.name,s.partsNo,s.positions,s.description,sum(p.partsNum)-sum(p.useNum) 剩余量
from huachengdb.car_parts s,
(
select s.id,s.car_parts_id,s.num partsNum,case when sum(p.usedNum) is null then 0 else sum(p.usedNum) end as useNum
from huachengdb.parts_store s left JOIN huachengdb.project_parts p
on s.id = p.car_partStoreId group by s.id
) p
where s.id = p.car_parts_id group by p.car_parts_id;

		
 */