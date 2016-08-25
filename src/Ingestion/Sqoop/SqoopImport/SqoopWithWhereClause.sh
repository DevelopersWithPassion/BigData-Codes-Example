
<<COMMENT
 Where  : its is used to import subset of data which satisfy filtering condition specify with it.
 
 Note This where parameter should be avoided because sqoop transfer data in parallel and 
 any complex expansive(time of execution) function used in where parameter may cause decrease in performance.
 
 Alternative is to filter the table and copy them into temporary table and then perform sqoop import.
COMMENT

sqoop import \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--password root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--where "columnname = 'value'"