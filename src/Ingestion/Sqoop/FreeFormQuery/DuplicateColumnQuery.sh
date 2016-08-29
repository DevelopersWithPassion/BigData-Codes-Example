<<COMMENT
Sometime it may happen that in query two table contains same column name with different values or nature
in that case you will get eroor like

 Imported Failed: Duplicate Column identifier specified: 'columnName'
 
 To Avoid this problem use alias name for columns.
 
COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile \
--query 'SELECT a.id as aid,b.sales ,b.id as bid\
FROM a \
JOIN b USING(id) \
WHERE $CONDITIONS' \
--split-by id \
--target-dir cities \
--boundary-query "select min(id), max(id) from a"