<<COMMENT
 Target Directory : Target directory in sqoop is directory where you want to put your output data. there are 
 two ways to specify target directoty in sqoop.
 
 1.--target-dir : Parameter to specify the directory on HDFS where Sqoop should import your data.
 2.--warehouse-dir : Parameter to specify the parent directory for all your Sqoop jobs
 
 
 If you want to run multiple Sqoop jobs for multiple tables, you will need to change the
--target-dir parameter with every invocation. As an alternative, Sqoop offers another
parameter by which to select the output directory. 
Instead of directly specifying the final directory, the parameter --warehouse-dir allows you to specify only the parent directory.
Rather than writing data into the warehouse directory, Sqoop will create a directory with the same name as the table inside the warehouse directory and import data there.
This is similar to the default case where Sqoop imports data to your home directory on
HDFS, with the notable exception that the --warehouse-dir parameter allows you to
use a directory other than the home directory. Note that this parameter does not need
to change with every table import unless you are importing tables with the same name.
       
COMMENT


#Using --target-dir option

sqoop import \
--connect jdbc:postgresql://localhost:5432/databsename \
--username sqoop \
--password sqoop \
--table  tablename\
--target-dir /incoming/raw/tablename


#Using --warehouse-dir

sqoop import \
--connect jdbc:postgresql://localhost:5432/databsename \
--username sqoop \
--password sqoop \
--table  tablename\
--warehouse-dir /incoming/raw/


