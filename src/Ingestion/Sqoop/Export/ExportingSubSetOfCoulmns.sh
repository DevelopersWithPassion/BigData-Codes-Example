<<COMMENT

Sometime you may want to export only subset of columns to target tables. for example you have table containing 10 columns
but your hdfs contains only 5 columns , in that case you have to specify export column externally.

--columns : Allow you to specify columns externally 

remember column that you are not specifying here should allow null or default value in RDBMS system otherwise you will get an error
and export will fail.

COMMENT


sqoop export \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--table tableName \
--export-dir DirectoryPathOnHdfs \
--columns columns1,column2,column3







