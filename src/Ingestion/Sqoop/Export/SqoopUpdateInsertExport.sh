<<COMMENT
We have already explained how you can perform update only operation in sqoop export in SqoopExportUpdateChanges

but you may want to perform update and insert simulatneoulsy . Remember all database does not support this
functionality.
Currently it’s available only for Oracle and nondirect MySQL exports.

COMMENT


sqoop export \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--table tableName \
--export-dir DirectoryPathOnHdfs \
--update-key columnName \
--update-mode allowinsert
