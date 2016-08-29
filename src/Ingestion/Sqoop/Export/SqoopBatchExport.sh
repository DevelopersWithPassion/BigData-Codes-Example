<<COMMENT
normal sqoop export will insert value in sqoop one row at a time. this makes process little slow
sqoop provides option to insert in batches following options .

1. --batch : Enables sqoop to perform insert in batches
2. sqoop.export.records.per.statement : specify the number of records that will be used in each insert statement

 
sqoop.export.statements.per.transaction : Sets how many rows will be inserted per transaction

COMMENT

###Using --batch option
sqoop export \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--table tableName \
--export-dir DirectoryPathOnHdfs \
--batch

 
###Using Dsqoop.export.records.per.statement

sqoop export \
-Dsqoop.export.records.per.statement=20 \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--table tableName \
--export-dir DirectoryPathOnHdfs \
