<<COMMENT
Sqoop can import data to hbase directally. 


CEOMMENT

sqoop import \
-Dsqoop.hbase.add.row.key=true \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase \
--hbase-table cities \
--column-family world
