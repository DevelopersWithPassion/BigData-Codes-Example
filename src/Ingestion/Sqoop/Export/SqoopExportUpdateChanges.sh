<<COMMENT
You may have situation where some data is being updated in your hadoop system and you want to update it in 
RDBMS system . you can use Update feature of sqoop 

--update-key : specify update key from table usually primary key which sqoop uses to fire update commands 

COMMENT


sqoop export \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--table tableName \
--export-dir DirectoryPathOnHdfs \
--update-key columnName