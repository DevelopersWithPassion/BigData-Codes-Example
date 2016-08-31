<<COMMENT
Sqoop Maps and convert the data types of each column from your source table to hive compatible type.
but sometime default mapping does not fit in that case you can 

--map-column-hive : This parameter expects a comma-separated list of key-value pairs separated by the equal sign (=) in order to
specify which column should be matched to which type in Hive.


Note : Sqoop will first do a normal HDFS import to a temporary location.
After a successful import ,Sqoop generates two queries: 
1. creating a table
2. loading the data from a temporary location. 

You can specify any temporary location using either the --target-dir or --warehouse-dir parameter. It’s
important not to use Hive’s warehouse directory (usually /user/hive/warehouse) for
the temporary location, as it may cause issues with loading data in the second step.

COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile 
--hive-import \		
--map-column-hive col1=HiveDataType,col2=HiveDataType