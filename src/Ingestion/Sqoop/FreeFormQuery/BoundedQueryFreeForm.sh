<<COMMENT
Before starting Mapreduce job using freeform query , sqoop tries to fetch min and max value for column
specified in --split-by parameter which is needed to break the data into independent task. This takes very long time
in fetching this values.

Sqoop Provides --boundary-query to fetch min and max value using valid query. 

Sqoop uses the table’s primary key by default and generates the query
 select min(col), max(col) from tbl (for table tbl and split column col)
 
 this is an inefficient way to fetch the min and max value. if you know the boundries of query in advance
 put values instead of  fetching it
 
 select 1,100

COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile \
--query 'SELECT a.id,b.sales \
FROM a \
JOIN b USING(id) \
WHERE $CONDITIONS' \
--split-by id \
--target-dir cities \
--boundary-query "select min(id), max(id) from a"