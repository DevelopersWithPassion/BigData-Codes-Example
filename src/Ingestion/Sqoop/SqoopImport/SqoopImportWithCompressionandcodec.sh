<<COMMENT
 We all know the benefit of compression, if not in simple term compression can reduce the size of output data and help
 in reducing transfer time over network in mapreduce job. Hadoop has powerful feature of compression and sqoop provide facility to use that.
 
 we can enable compression in two ways 
 
 1. --compress
 2. -z
 
 with compress enables the default compression codec will be GZip. if you want to change codec you can use 
 --compression-codec option 
 
 Important : As Sqoop delegates compression to the MapReduce engine, you need
to make sure the compressed map output is allowed in your Hadoop
configuration. For example, if in the mapred-site.xml file, the property
mapred.output.compress is set to false with the final flag, then
Sqoop won’t be able to compress the output files even when you call it
with the --compress parameter.
COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect --connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename\
--target-dir /incoming/raw/tablename
--password-file yourpasswordfordatabase
--as-sequencefile
--compression-codec org.apache.hadoop.io.compress.BZip2Codec
--compress

sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect --connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename\
--target-dir /incoming/raw/tablename
--password-file yourpasswordfordatabase
--as-avrodatafile
--compression-codec org.apache.hadoop.io.compress.BZip2Codec
-z
