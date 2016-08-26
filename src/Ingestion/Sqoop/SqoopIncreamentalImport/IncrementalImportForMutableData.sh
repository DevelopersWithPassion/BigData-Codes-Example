<<COMMENT

As you seen in IncrementImport example with append mode, you will not be able to retrieve any updated raws in next 
import. if your table is getting updated as well you should avoid update mode and use lastmodified mode.

The incremental mode lastmodified requires a column holding a date value (suitable
types are date, time, datetime, and timestamp) containing information as to when each
row was last updated.

 The lastmodified incremental import executes 2 Mapreduce job
 
1. The first job will import the delta of changed data similarly to normal
import. This import job will save data in a temporary directory on HDFS. 

2.The second job will take both the old and new data and will merge them together into the final
output, preserving only the last updated value for each row.

COMMENT 


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile \
--incremental lastmodified \
--check-column last_update_date \
--last-value "2016-08-26 10:44:32"

