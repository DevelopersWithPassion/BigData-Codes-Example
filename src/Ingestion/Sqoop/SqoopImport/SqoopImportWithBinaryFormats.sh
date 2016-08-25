<<COMMENT
 By Default Sqoop imports file in text format. if you want to change the import file format and make to any binary format over  
you have four options as per version 1.4.6

1. --as-sequencefile
2.--as-avrodatafile
3.--as-parquetfile	
4.--as-textfile	

Binary formats have a few benefits over that of text files. First, binary formats are a
natural fit for storing binary values like images or PDF documents.

Important : They are also more suited for storing text data if the data itself contains characters that are otherwise used
as separators in the text file. 
Sometime you may face problem while exporting to RDBMS system that unable to parse file due to some special character in
records that conflict with record separator. in that case you should go for binary format as an option for your import and then export in same way

COMMENT


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect --connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase \
--as-sequencefile


sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect --connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase \
--as-avrodatafile



sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect --connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase \
--as-parquetfile



sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect --connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase \
--as-textfile