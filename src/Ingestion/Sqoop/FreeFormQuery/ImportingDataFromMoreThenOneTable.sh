
<<COMMENT
Sometime you may want to import data from more the one table based on some join condition or you want to 
get data from normalized table which is in 3NF. Sqoop provides following parameters 

1. --query - allows to write queries that can fetch data from multiple tables. 
2. --split by :used for slicing your data into multiple parallel tasks.

To help Sqoop split your query into multiple chunks that can be transferred in parallel, you
need to include the $CONDITIONS placeholder in the where clause of your query. Sqoop
will automatically substitute this placeholder with the generated conditions specifying
which slice of data should be transferred by each individual task. While you could skip
$CONDITIONS by forcing Sqoop to run only one job using the --num-mappers 1 parameter,
such a limitation would have a severe performance impact.

--warehouse-dir would not be applicable with free form queries. Free form queries are slower then table import 
queries.

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
--target-dir cities