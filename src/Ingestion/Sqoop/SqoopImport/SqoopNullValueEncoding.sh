<<COMMENT
Every Database has their own representation of String and non-String value which is null.

If you want to change the source system representation of NULL value to any encoded value ,
Sqoop provides you the following options

1. --null-string
2. --null-non-string

COMMENT

sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename \
--target-dir /incoming/raw/tablename \
--password-file yourpasswordfordatabase \
--null-string '\\N' \
--null-non-string '\\N'