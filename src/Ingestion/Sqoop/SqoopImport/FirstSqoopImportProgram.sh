## This is first sqoop import program using postgreshsql

sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--table sample \