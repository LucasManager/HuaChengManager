/**
 * 客户信息
 */
create table customer(
	id 		int primary key,
	name 	varchar2(100),
	phone	varchar2(50), 
	address varchar2(200),
	desc 	varchar2(500),
	UTD1 	varchar2(200),
	UTD2 	varchar2(200)
)
create table car(
	id 			int primary key,
	cust_id 	int foreign key references customer(id),
	carType 	varchar2(50),
	carNum 		varchar2(100),
	car_color 	varchar(50),
	mileage 	varchar2(50),-- 进场里程
	VIN			varchar2(50),--车架识别码
	desc 		varchar2(200),
	UTD1 		varchar2(200),
	UTD2 		varchar2(200)
)


/**
 * 配件信息
 */
create table car_parts(
	id 			int primary key ,
	name 		varchar2(100),	
	type 		varchar2(20),
	position 	varchar2(200),
	desc 		varchar2(500),
	UTD1 		varchar2(200),
	UTD2 		varchar2(200)
)
/**
 *如数据库中已存在此类型的配件，则提示 该配件已存在，需要查询得到该配件  点击修改，
 *新增  进货记录即可
 * 
 */

/**
 * 库存管理
 */
create table parts_store(
	id 				int primary key,
	car_parts_id 	int foreign key references car_parts(id),
	parts_num 	varchar2(100),--型号
	increase_Date 	varchar2(20), --进货时间
	num				int,--进货总量
	surplus_num		int,--剩余量
	unit_price 		int,--单价
	sum_price 		int,--此次进货的总的价格
	desc 			varchar2(200),
	UTD1 			varchar2(200),
	UTD2 			varchar2(200)
)

create table project(
	id 				int primary key,
	cust_id 		int foreign key references customer(id),
	car_parts_id 	int foreign key references car_parts(id),
	car_id 			int foreign key references car(id),
	projectType 	varchar2(100),
	projectName 	varchar2(200),
	parts_num 		int,
	parts_unit_price int ,
	other_price 	int,--若换取配件加维修，则此为维修费用
	startDate 		varchar2(20),---服务开始时间
	endDate 		varchar2(20),--服务结束时间
	outServiceDate 	varchar2(20),--维修保质时间
	chargePerson	varchar2(100),
	status			varchar(10), --当前项目的状态：已完成(付款成功，则认为该项目已完成)、
								--未完成(缺件、不可完成、未付款、其他原因，可在备注中说明)
	desc 			varchar2(200),
	UTD1 			varchar2(200),
	UTD2 			varchar2(200)
)

create table lack_parts(
	id int primary key,
	car_parts_id 	int foreign key references car_parts(id),
	cust_id 		int foreign key references customer(id),
	needNum			int,
	status 			varchar2(10),   ---缺件状态：以补充完成   未补充完成


)
