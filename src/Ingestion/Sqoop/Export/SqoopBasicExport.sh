<<COMMENT
you have worked with imports , Now you may have some use case where you want to put data from Hadoop into
RDBMS system. Sqoop provide export facility to do so. it works similar to import with slight different 



export : parameter to specify and tells sqoop to export data
--export-dir : DIrectory from where sqoop will fetch data and put into rdbms

COMMENT

sqoop export \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--table tableName \
--export-dir DirectoryPathOnHdfs
