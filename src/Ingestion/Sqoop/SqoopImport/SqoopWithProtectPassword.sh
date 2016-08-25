<<COMMENT
 when you run import you specify username and password by using parameter --username and --password respectively.
 this is not secure as your password will be printed on console or it will be in file.
 
 To make it secure sqoop provides 2 option to deal with it
 
 1. -P : This parameter will promt you a message to enter password and n one can see the typed password . But using this option you will face some issue in automating your script 
 because you have to enter password at every sqoop import.
 
 2. --password-file : This solves the peoblem that exists with -P option for automating the script. this parameter will take an location of file which should be present on hdfs. the file will contain password for your database. please note that
 you should give valid permission security to your file. you can do it by using following command
 
 
 
 hadoop dfs -chown 400 /hdfspathforFile
 
 
 Note that file should not contain any trail or white spaces.
COMMENT



sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
-P





sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect --connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase
