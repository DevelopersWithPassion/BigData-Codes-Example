
<<COMMENT
Incremental Import : Suppose you have imported data from particular RDMS table yesterday. and today you have to again 
import data from same table, what you will do. if you put normal import you will get data which you have already imported yesterday
but you wanted to get new inserted  data in table. Now to avoid this condition sqoop provides option of incremental import 

--incremental : This parameter is used to specify incremental import. It also uses two additional parameters:
 A. --check-column : a column name that should be checked for newly appended data, 
 B.   --last-value : contains the last value that successfully imported into Hadoop.
 
 you need to know the value of the last imported row so that next time Sqoop can start off where it ended
 
 Any changed rows that were already imported from previous runs
won’t be transmitted again. This method is meant for tables that are
not updating rows.

COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile 
--incremental append \
--check-column columnnamewithprimarykey \
--last-value lastreadvalue
