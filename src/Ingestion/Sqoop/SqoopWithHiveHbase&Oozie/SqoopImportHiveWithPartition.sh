<<COMMENT

Sometime you may want to load data into hive partition rather then directally  into table. Use

--hive-partition-key : accepts hive solun name
--hive-partition-value : value for column 


Limitations : Loading data in partitions has some limitations 
1. Single Column : ypu can specify only single column for now . Means if you have to use 2 columns for partition 
with sqoop you will not be able to do so.

2. STRING : Sqoop support only string value for partition value. 

3. Dynamic Partition : There is no support for dynamic partition exists in Sqoop. JIRA issue is still unresolved
 
https://issues.apache.org/jira/browse/SQOOP-312




COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile 
--hive-import \		
--hive-partition-key columnname \
--hive-partition-value "value"