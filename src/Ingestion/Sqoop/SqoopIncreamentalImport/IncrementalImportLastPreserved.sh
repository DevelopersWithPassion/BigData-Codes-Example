<<COMMENT
In Incremental import you have to remember last value which if being fetched by sqoop. Sqoop Provides metestore that 
allows you to store all the values for later use .

there are two steps to run the jate job ob now
1. --create : Create job using this parameter 
2. sqoop job --exec : run the job using this command. 


The most important benefit of the built-in Sqoop metastore is in conjunction with
incremental import. Sqoop will automatically serialize the last imported value back into
the metastore after each successful incremental job. This way, users do not need to
remember the last imported value after each execution; everything is handled automatically.

COMMENT


##CreateJob
sqoop job \
--create jobName \
-- \
import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table tablename \
--password-file locationofpasswordfile 
--incremental append \
--check-column columnnamewithprimarykey \
--last-value lastreadvalue

##Run Job

sqoop job --exec jobName