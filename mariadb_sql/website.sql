drop database if exists website;
create database job;
use job;
/*------------------------------------------------公共模块--------------------------------------------------------*/
create table region (
  id 					int  				not null 								comment '区域',
  parent_id 		int		 		not null 								comment '父级区域',
  path 				varchar(32) 	not null 		default '' 			comment '路径枚举',
  level 				tinyint  		not null 								comment '层级',
  name 				varchar(64)  	not null 								comment '区域名称',
  primary key (id),
  key index_1 (parent_id),
  key index_2 (path)
) 
row_format=compressed 
comment='可扩展带路径枚举的区域表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table trade 
(
  id 						smallint  			not null 	auto_increment 						comment '主键',
  parent_id 			smallint  			not null 	default 	0 								comment '父编号',
  path 					varchar(32)  		not null 												comment '行业路径',
  name 					varchar(64)  		not null 	default '' 								comment '行业名称',
  images 				blob 																				comment '行业图片',
  sortid 				smallint  			not null 	default 	0 								comment '值越少排在越前面',
  type 					tinyint  			not null 	default 	1 								comment '1商户行业，2广告行业',
  level 					tinyint  			not null 	default 	1 								comment '类别等级',
  visible 				tinyint  			not null 	default 	1 								comment '1显示，0隐藏',
  certificate 			tinytext  																		comment '行业对应的资质说明',
  note 					tinytext  																		comment '备注',
  cdate 					datetime 			not null													comment '创建时间',
  primary key (id),
  key index_1 (parent_id),
  key index_2 (path)
) 
engine=innodb 
auto_increment=2016 
row_format=compressed 
comment='行业信息'
;
/*--------------------------------------------------------------------------------------------------------------*/
drop table sms;
create table sms
(
	id					bigint				not null										comment	'主键',
	mobile			varchar(16)			not null										comment	'接收短信的手机号码',
	content			varchar(128)		not null		default	''					comment	'短信内容',
	status			tinyint				not null		default	1					comment	'1.成功,2.失败',
	status_note		varchar(64)			not null		default	''					comment	'状态说明',
	cdate				datetime																comment	'短信发送时间',
	primary key (id)
)
row_format=compressed
comment='超级管理员表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table admin
(
	id					smallint				not null									comment	'主键',
	account			varchar(16)			not null									comment	'管理员账号',
	password			varchar(64)			not null									comment	'密码',
	type				tinyint				not null			default	2			comment	'1:超级管理员,2为核审人员,3财务人员',
	note				varchar(32)			not null			default	''			comment	'备注',
	primary key (id)
)
row_format=compressed
comment='超级管理员表'
;
insert into admin(id,account,password,type,note) values (1,'super',password('123456'),1,'超级管理员');
/*--------------------------------------------------------------------------------------------------------------*/
create table admin_log
(
	id					bigint				not null											comment	'主键',
	ip					varchar(16)			not null											comment	'登陆时的ip',
	info				varchar(64)			not null			default	''					comment	'日志信息',
	cdate				datetime				not null			default	current_time	comment	'冲值时间',
	primary key (id)
)
row_format=compressed
comment='超级管理员表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table basic_set
(
	k          		varchar(32)																comment	'键',
	v					varchar(32)				not null										comment	'值',
	note				varchar(64)				not null			default ''				comment	'键的作用说明',
	primary key(k)
)
row_format=compressed
comment='全站初始化表'
;
insert into basic_set(k,v,note) values ('resume_price','10.00','查看简历价格');
insert into basic_set(k,v,note) values ('post_price','10.00','查看岗位价格');
insert into basic_set(k,v,note) values ('withdrawal_fee','0.05','提成手续费初始为5%');
insert into basic_set(k,v,note) values ('first_resume_bonus','2.00','被推荐人简历被查看可获得的奖金');
insert into basic_set(k,v,note) values ('second_resume_bonus','1.00','被推荐人的被推荐人简历被查看可获得的奖金');
insert into basic_set(k,v,note) values ('thirdly_resume_bonus','1.00','被推荐人的被推荐人的被推荐人简历被查看可获得的奖金');
insert into basic_set(k,v,note) values ('first_post_bonus','2.00','被推荐人岗位信息被查看可获得的奖金');
insert into basic_set(k,v,note) values ('second_post_bonus','1.00','被推荐人的被推荐人岗位信息被查看可获得的奖金');
insert into basic_set(k,v,note) values ('thirdly_post_bonus','1.00','被推荐人的被推荐人的被推荐人岗位信息被查看可获得的奖金');
/*--------------------------------------------------------------------------------------------------------------*/
create table account
(
	id					bigint				not null									comment	'主键',
	account			varchar(16)			not null									comment	'账号,一般是手机号码',
	password			varchar(64)			not null									comment	'密码',
	pay_password	varchar(64)			not null			default ''			comment	'支付密码',
	status			tinyint				not null			default	1			comment	'1为用户，2为商家',
	primary key (id),
	unique  key uq_account(account),
	index index_account(account)	
)
row_format=compressed
comment='账户信息表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table account_relate
(
	account_id		bigint				not null									comment	'关联account表的主键',
	account			varchar(16)			not null			default ''			comment	'账号,冗余字段',
	first_id			bigint				not null			default  0			comment	'直接推荐人,0代表无推人',
	second_id		bigint				not null			default	0			comment	'推荐人的推荐人,0代表无推人',	
	thirdly_id		bigint				not null			default	0			comment	'推荐人的推荐人的推荐人,0代表无推人',	
	primary key(account_id)										
)
row_format=compressed
comment='账户层级关系表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table account_recharge
(
	id					bigint				not null										comment	'主键',
	account_id		bigint				not null										comment	'关联account表的主键',	
	money				decimal(8,2)		not null		default	0.00				comment	'冲值金额',
	way				tinyint				not null		default	1					comment	'1.微信支付,2支付宝支付',
	cdate				datetime				not null		default	current_time	comment	'冲值时间',
	primary key (id),
	index index_account_id(account_id)	
)
row_format=compressed
comment='账户冲值记录表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table account_cash
(
	id					bigint				not null										comment	'主键',
	account_id		bigint				not null										comment	'关联account表的主键',	
	money				decimal(8,2)		not null		default	0.00				comment	'提现金额',	
	way				tinyint				not null		default	3					comment	'1.微信支付,2支付宝支付,3.线下打款',
	status			tinyint				not null		default	1					comment	'1.提现中,2.处理中,3.提现成功,4.提现失败',
	status_note		varchar(128)		not null		default	''					comment	'状态说明',
	cdate				datetime				not null		default	current_time	comment	'提现申请时间',
	mdate				datetime				not null		default	current_time	comment	'最后修改时间',
	primary key (id),
	index index_account_id(account_id)								
)
row_format=compressed
comment='账户提现记录表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table account_income
(	
	account_id		bigint				not null										comment	'关联account表的主键',	
	money				decimal(8,2)		not null		default	0.00				comment	'收入金额',
	primary key (account_id)
)
row_format=compressed
comment='账户收入记录表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table account_income_item
(
	id					bigint				not null																		comment	'主键',
	account_id		bigint				not null																		comment	'关联account表的主键',	
	money				decimal(8,2)		not null		default	0.00												comment	'收入金额',
	type           tinyint				not null		default	1													comment	'1.推荐求职者简历被查阅所得,2推荐商家职位被查阅所得',
	cdate				datetime				not null		default	current_time									comment 	'获得收入日期',
	cdate_int		int					not null																		comment 	'获得收入日期对应的int类型',
	note				varchar(64)			not null		default	''													comment	'收入说明',
	primary key (id),
	index index_account_id(account_id)		
)
row_format=compressed
comment='账户收入明细记录表,只做查看，不做统计余额'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table account_consume
(
	id					bigint				not null										comment	'主键',
	account_id		bigint				not null										comment	'关联account表的主键',	
	money				decimal(8,2)		not null		default	0.00				comment	'消费金额',
	type           tinyint				not null		default	1					comment	'1.查看求职者简历消费,2查看商家职位消费',
	cdate				datetime				not null		default	current_time	comment 	'消费日期',
	note				varchar(64)			not null		default	''					comment	'消费说明',
	primary key (id),
	index index_account_id(account_id)		
)
row_format=compressed
comment='账户消费明细记录表'
;
/*------------------------------------------------酒店模块--------------------------------------------------------*/
create table hotel
(
	id					bigint				not null										comment	'主键',
	account_id		bigint				not null										comment	'关联account表的主键',	
	name				varchar(32)			not null										comment	'酒店名称',
	charge			varchar(32)			not null										comment	'酒店负责人',
	mobile		   varchar(16)       not null										comment	'负现人手机号码',
	tel				varchar(16)       not null		default  ''					comment  '酒店电话号码',
	license_url	   varchar(128)      not null		default  ''					comment	'营业执照图片地址',	
	region_id		int					not null		default	0					comment	'区域编号',	
	address			varchar(64)       not null    default	''    			comment 	'酒店地址',
	status			tinyint				not null		default	1					comment	'1为审核中，2为通过，3为审核失败',
	status_note		varchar(128)		not null		default	''    			comment  '状态说明，如审核失败的原因',
	content			text					not null		default	''					comment	'酒店介绍',
	cdate				datetime				not null		default	current_time	comment 	'注册日期',
	primary key (id),
	index index_account_id(account_id)	
)
row_format=compressed
comment='酒店信息表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table post
(
	id					bigint				not null										comment	'主键',
	account_id		bigint				not null										comment	'关联account表的主键',	
	hotel_id			bigint				not null										comment	'酒店编号',
	name				varchar(64)			not null		default	''					comment	'职位名称',
	pay_min			int					not null		default	0					comment	'职位最低薪资',
	pay_max			int					not null		default	0					comment	'职位最高薪资',
	region_id		int					not null		default	0					comment	'区域编号',
	is_eat			int					not null		default	1					comment	'1.不包吃,2.包吃一餐,3.全包吃',
	is_live			int					not null		default	1					comment	'1.不包住,2.包住',		
	is_security    int					not null		default	1					comment	'1.不买社保，2.买社保',
	is_fund			int					not null		default	1					comment	'1.不买公积金,2.买公积金',
	start_time		varchar(8)			not null		default	''					comment	'上班开始时间',
	end_time			varchar(8)			not null		default	''					comment	'上班结束时间',
	rest_day			int					not null		default	0					comment	'每个月休息的天数',
	other_welfare  varchar(512)		not null		default	''					comment	'其它福利',
	ask				varchar(512)		not null		default	''					comment	'岗位要求',
	work_type		tinyint				not null		default	1					comment	'工作类型:1.全职,2.兼职,3.实习',			
	cdate				datetime				not null		default	current_time	comment 	'创建日期',	
	status			tinyint				not null		default	1					comment	'1.上架，2.下架',
	primary key (id),
	index index_account_id(account_id)			
)
row_format=compressed
comment='岗位信息表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table post_count
(
	id					bigint				not null										comment	'主键',
	account_id		bigint				not null										comment	'关联account表的主键',	
	hotel_id			bigint				not null										comment	'酒店编号',
	post_id			bigint				not null										comment	'职位编号',
	region_id		int					not null				default	0			comment	'区域编号,可以省可以市可以县',
	cnt				bigint				not null				default	0			comment	'被购买的次数',
	primary key (id),
	unique  key uq_account(account_id,hotel_id,post_id)
)
row_format=compressed
comment='岗位被购买的次数'
;
/*------------------------------------------------求职者模块--------------------------------------------------------*/
create table person
(
	id						bigint				not null											comment	'主键',
	account_id			bigint				not null											comment	'关联account表的主键',	
	name					varchar(16)			not null			default	''					comment	'求职者姓名',
	identity_card		varchar(24)			not null			default	''					comment	'身份证号码',
	sex					tinyint				not null			default	1					comment	'1.男，2.女',
	birthday				varchar(16)			not null			default	''					comment	'生日',
	head_image_url		varchar(256)		not null			default	''					comment	'头像',
	mobile				varchar(16)			not null			default	''					comment	'手机号码',
	cdate					datetime				not null			default	current_time	comment 	'创建日期',	
	primary key(id),
   index index_account_id(account_id)
)
row_format=compressed
comment='求职者基本信息表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table resume
(
	id						bigint				not null											comment	'主键',
	account_id			bigint				not null											comment	'关联account表的主键',	
	salary				tinyint				not null			default	1					comment	'期望薪水，1代表0-1000,2代表1000-2000,以此类推',
	self_assessment	varchar(512)		not null			default	''					comment	'自我评价',
	come_time			tinyint				not null			default	1					comment	'到岗时间:1.随时,2.1周内,2.一个月内,3.三个月内,4.待定',
	work_type			tinyint				not null			default	1					comment	'工作类型:1.全职,2.兼职,3.实习',
	start_year			smallint				not null			default  1900           comment	'开始工作年份',
	work_status			tinyint				not null			default	1					comment	'目前工作状况:1.正在找工作,2.观望有好机会会考虑',
	cdate					datetime				not null			default	current_time	comment 	'创建日期',	
	primary key(id),
   index index_account_id(account_id)									
)
row_format=compressed
comment='简历信息表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table resume_capacity
(
	id						bigint				not null											comment	'主键',
	account_id			bigint				not null											comment	'关联account表的主键',	
	resume_id			bigint				not null											comment	'简历编号',
	capacity_id			int					not null											comment  '职能编号',
	capacity_name		varchar(32)			not null		  default	''					comment	'职能名称，冗余字段',
	primary key(id),
   index index_account_id(account_id)	
)
row_format=compressed
comment='简历职能表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table resume_area
(
	id						bigint				not null											comment	'主键',
	account_id			bigint				not null											comment	'关联account表的主键',	
	resume_id			bigint				not null											comment	'简历编号',
	city_id				int					not null											comment	'城市编号',
	city_name			varchar(32)			not null			default	''					comment	'城市名称',
	primary key(id),
   index index_account_id(account_id)	
)
row_format=compressed
comment='上班地点表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table resume_experience
(
	id						bigint				not null											comment	'主键',
	account_id			bigint				not null											comment	'关联account表的主键',	
	resume_id			bigint				not null											comment	'简历编号',
	company				varchar(32)			not null			default	''					comment	'公司名称',
	company_scale		tinyint				not null			default	1					comment	'公司规模:1.少于50人,2.50-150人,3.150-500人,4.500人以上',
	start_date			date					not null			default	current_date	comment	'开始日期',
	end_date				date					not null			default	current_date	comment	'离职日期',
	capacity_id			int					not null											comment  '职能编号',
	capacity_name		varchar(32)			not null		  	default	''					comment	'职能名称，冗余字段',
	department			varchar(16)			not null			default	''					comment	'部门',
	content				varchar(512)		not null			default	''					comment	'工作描述',
	work_type			tinyint				not null			default	1					comment	'工作类型:1.全职,2.兼职,3.实习',
	cdate					datetime				not null			default	current_time	comment 	'创建日期',	
	primary key(id),
   index index_account_id(account_id)	
)
row_format=compressed
comment='简历工作经历表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table resume_experience_pic
(
	id								bigint				not null											comment	'主键',
	account_id					bigint				not null											comment	'关联account表的主键',	
	resume_id					bigint				not null											comment	'简历编号',
	resume_experience_id		bigint				not null											comment	'工作经验编号',
	product_pic_url			varchar(256)		not null											comment	'工作经验作品图片',
	cdate							datetime				not null			default	current_time	comment 	'创建日期',	
	primary key(id),
   index index_account_id(account_id)	
)
row_format=compressed
comment='简历工作经历作品图片表'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table resume_count
(
	id					bigint				not null										comment	'主键',
	account_id		bigint				not null										comment	'关联account表的主键',	
	resume_id		bigint				not null										comment	'简历编号',
	cnt				bigint				not null				default	0			comment	'被购买的次数',
	primary key (id),
	unique  key uq_account(account_id,resume_id)
)
row_format=compressed
comment='简历被购买的次数'
;
/*------------------------------------------------交易模块--------------------------------------------------------*/
create table hotel_resume_relate
(
	account_id		bigint				not null										comment	'关联account表的主键',	
	hotel_id			bigint				not null										comment	'酒店编号',
	resume_id		bigint				not null										comment	'简历编号'
)
row_format=compressed
comment='简历被购买的次数'
;
/*--------------------------------------------------------------------------------------------------------------*/
create table person_post_relate
(
	account_id		bigint				not null										comment	'关联account表的主键',	
	person_id		bigint				not null										comment	'求职者编号',
	post_id			bigint				not null										comment	'岗位编号'
)
row_format=compressed
comment='岗位被购买的次数'
;
/*--------------------------------------------------------------------------------------------------------------*/

