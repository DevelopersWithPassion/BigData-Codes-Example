
<<COMMENT
Sqoop is preconfigured to map most SQL types to appropriate Java or Hive representatives. 
However the default mapping might not be suitable for everyone and might be overridden by —map-column-java (for changing mapping to Java) or —map-column-hive (for changing Hive mapping).
 there are two options for controlling type mapping
 1. --map-column-java
 2. --map-column-hive
 
 Example and Uses : 
 1. when your MySQL table has a primary
key column that is defined as unsigned int with values that are bigger than 2 147 483
647. In this particular scenario, MySQL reports that the column has type integer, even
though the real type is unsigned integer. The maximum value for an unsigned inte
ger column in MySQL is 4 294 967 295. Because the reported type is integer, Sqoop
will use Java’s Integer object, which is not able to contain values larger than 2 147 483
647.

2. if you’re using BLOB or BINARY columns for storing textual data to avoid any encoding issues, you can use
the --column-map-java parameter to override the default mapping and import your
data as String.
 
COMMENT

###Java Type Mapping
sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename\
--map-column-java column1=Long,column2=String,column3=Float
--target-dir /incoming/raw/tablename
-P


###Hive Type Mapping

sqoop import \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost:5432/databsename \
--username root \
--table  tablename\
--hive-import \
--hive-table databaseName.tableName -m 1
--map-column-hive column1=STRING,column2=DECIMAL



-P








