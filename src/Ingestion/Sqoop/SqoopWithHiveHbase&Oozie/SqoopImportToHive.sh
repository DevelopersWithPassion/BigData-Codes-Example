

<<COMMENT
you will find many use cases where you have to import table from RDBMS system and store that into hive tables.


--hive-import : Parameter used to store data into hive 

If table does not exists in hive then sqoop creates table by using metadata which it has for table. if table already exists
sqoop will simply append the data to table.

Column Mapping : Sqoop Maps and convert the data types of each column from your source table to hive compatible type.


By Default sqoop will append the data to hive but if you need to delete existing data and load new one you can use 

--hive-overwrite : parameter to tell sqoop to delete existing data and add newly imported data


COMMENT


##Default Append Mode

sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile \
--hive-import


## Overwrite Mode

sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile \
--hive-import \
--hive-overwrite