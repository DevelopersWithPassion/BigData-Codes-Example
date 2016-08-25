<<COMMENT
Sqoop provide metadata information to Hadoop and the launches Map Task to do Import and export. 
By Default 4 Mapper get launched to import or export data but you can control the number of mappers to be launched

There are two ways to do this 

1. --num-mappers
2. -m 

However Most of the cases you will get number of mapper specified but its not guarenteed. Remember while choosing
number of mapper that if you choose large number of mapper that may cause your process to get slow because RDBMS system will spend more
time in deciding for which mapper he should serve request(Context Switching).
COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase \
--num-mappers 7



sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase \
-m 7