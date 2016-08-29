<<COMMENT
sometime you want to have condition where you want to exports all the  data or export nothing . 

Sqoop provides concept of staging table.

1. --staging-table staging_cities : use this option to enable sqoop to use staging table. 
Sqoop will first copy data to staging table and once all the parallel tasks are completed sqoop will copy
the data into final RDBMS table.

If one of the tasks fails sqoop will not copy the data into target table. Please make sure following 
pre-requisites are made before providing staging table option

1. You have enough space in your database for stagging table
2. You must have same schema for staging table that you have for final table otherwise your job will fail.

--clear-staging-table : use this paramater to clear the staging table automatically. 

Note: Remember you need to create stagging table for yourself , sqoop will not create this for you.

COMMENT

sqoop export \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--table tableName \
--export-dir DirectoryPathOnHdfs \
--staging-table staging_tableName