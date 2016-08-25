<<COMMENT
 To speedup the process sqoop has option of using direct connect which does not use jdbc interface for tranfering 
 data from RDBMS to Hadoop.
 
 The direct mode delegates the job of transferring data to the native utilities provided by the database vendor
 Limitation is that you can not use many sqoop options when you run  in direct mode. all databases do not have available native utilities.


COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename\
--target-dir /incoming/raw/tablename
--direct
-P