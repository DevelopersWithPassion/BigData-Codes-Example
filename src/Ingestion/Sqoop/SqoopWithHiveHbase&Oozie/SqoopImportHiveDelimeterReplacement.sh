<<COMMENT
Sqoop will, by default, import data into comma-separated text files where each line
represents one row. However, if your data contains the new-line character (\n), such a
row will create two separate lines that will consequently be processed as two separate
rows by Hive. Consequently, Hive will show a higher row count than your source table.

Other default parameters like \t and \01 might also cause parsing issues; however, the
new-line character is the most common issue. You can instruct Sqoop to clean up your
data either with 

1. --hive-drop-import-delims

2. --hive-delims-replacement

Even though both parameters contain hive in their names, they are not restricted to
working in tandem with the --hive-import parameter. They can be used in any import
job using text files to ensure that the output files have one line per imported row. Also,
as they target the default delimiters, using them with custom delimiters is not recommended,
as they will always remove or substitute only the default delimiters.




CEOMMENT


## Drop Delimiter

sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile 
--hive-import \		
--hive-drop-import-delims



## Replace Delimiter

sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile 
--hive-import \		
--hive-delims-replacement "SPECIAL CHARACTER"