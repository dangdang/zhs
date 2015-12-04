<!--*******-->
<!--本文件主要是记录对服务器数据库的各种操作-->
<!--******-->

<!--执行数据操作时都需要先选择数据库-->
use tankdb;

<!--20150129 创建数据库  tk_project_type,20150209服务器同步执行sql-->
CREATE TABLE `tk_project_type` (
`id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
`project_type` varchar(60) NOT NULL,
`tk_project_typerank` varchar(60) NOT NULL,
`project_type_backup1` bigint(20) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

<!--20150129修改tk_project表中的project_type由tinyint类型改为varchar(60),20150209服务器同步执行sql-->
ALTER TABLE tankdb.tk_project CHANGE project_type project_type VARCHAR(60);


#################################################################################
<!--20150519更新了下述语句:与服务器同步更新 -->
<!--20150306 修改tk_user，为user增加一个字段，姓名的拼音全拼，为了检索方便-->
ALTER TABLE tankdb.tk_user ADD tk_pinyin VARCHAR(50) ;



<!--20150308 修改tk_project_type，将id更改为ptid (即，project type id)根据所里项目表增加项目字段-->
ALTER TABLE tankdb.tk_project_type CHANGE id ptid SMALLINT UNSIGNED;

<!--20150308 修改tk_project，根据所里项目表增加项目字段-->
<!--project_type改完整型，以减少数据库空间-->
ALTER TABLE tankdb.tk_project CHANGE project_type project_type INT;

ALTER TABLE tankdb.tk_project ADD project_source VARCHAR(60) NOT NULL;
ALTER TABLE tankdb.tk_project ADD project_month_eval INT(4) NOT NULL;
ALTER TABLE tankdb.tk_project ADD project_dean VARCHAR(10) NOT NULL;//主管院长
ALTER TABLE tankdb.tk_project ADD project_manager VARCHAR(30) NOT NULL;//项目负责人，第一负责人、第二负责人
ALTER TABLE tankdb.tk_project ADD project_chief_engineer VARCHAR(6) NOT NULL;//主管总工
ALTER TABLE tankdb.tk_project ADD project_Director VARCHAR(6) NOT NULL;//主管所长
ALTER TABLE tankdb.tk_project ADD project_Division_engineer VARCHAR(6) NOT NULL;//主管主任工
ALTER TABLE tankdb.tk_project ADD project_member VARCHAR(50) NOT NULL;//项目组成员
ALTER TABLE tankdb.tk_project ADD project_importance VARCHAR(10) NOT NULL;//项目重要度

ALTER TABLE tankdb.tk_project_type CHANGE project_type project_type_name VARCHAR(60);//避免两个数据库中的字段同名

//修改tk_project_type中ID排序为：指令、合同、临时为1、2、3，类似的顺序,这个可以不用在服务器的表格里修改了
############################################################################################