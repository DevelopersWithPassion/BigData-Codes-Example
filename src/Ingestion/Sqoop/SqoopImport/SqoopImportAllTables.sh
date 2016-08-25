<<COMMENT
Import All Tables : Suppose you have large number of tables in your source database and you 
want to fetch all of them OR most of them , What you will do?

The option before this functionality was to write sqoop import command for all the tables and then run it parallaly

But Sqoop has good option to import all or most of tables at once with just one sqoop script. 

1. import-all-tables : Imports all table from database
2. import-all-tables with --exclude-tables : Imports all table from database by skipping tables specified with --exclude-tables


you can not use some parameters with sqoop such as --target-dir. 

COMMENT


sqoop import-all-tables \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--warehouse-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase 


sqoop import-all-tables \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--exclude-tables cities,countries \
--warehouse-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase 
